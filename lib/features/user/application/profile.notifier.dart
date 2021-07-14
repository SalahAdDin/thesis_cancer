import 'package:flutter_chat_types/flutter_chat_types.dart' as fc_types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:http/http.dart";
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/chat/application/chat.provider.dart';
import 'package:thesis_cancer/features/chat/domain/chat.repository.dart';
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';
import 'package:thesis_cancer/features/media/domain/file_description.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.repository.dart';
import 'package:thesis_cancer/features/user/application/profile.state.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

///
class ProfileNotifier extends StateNotifier<ProfileState> {
  ///
  ProfileNotifier({
    required this.user,
    required this.reader,
  }) : super(const ProfileState.loading()) {
    init();
  }

  ///
  final User user;

  ///
  final Reader reader;

  Profile get _profile => user.profile ?? Profile.empty;

  FirebaseChatCore get _chatCore => FirebaseChatCore.instance;

  ChatRepository get _chatRepository => reader(chatRepositoryProvider);

  ProfileRepository get _profileRepository => reader(profileRepositoryProvider);

  UploadFileRepository get _uploadFileRepository =>
      reader(uploadFileRepositoryProvider);

  StateController<User?> get _userController =>
      reader(userEntityProvider.notifier);

  User? get _currentUser => _userController.state;

  ///
  int postsCount = 0;

  ///
  bool get isOwnProfile => user.id == _currentUser!.id;

  ///
  void toEditMode() => state = const ProfileState.editing();

  ///
  Future<fc_types.Room> createRoom() async {
    try {
      final fc_types.User otherUser = fc_types.User(
        id: _profile.uid!,
        firstName: _profile.firstName,
        lastName: _profile.lastName,
        imageUrl: _profile.profilePhoto?.url,
        role: _profile.role == UserRole.ADMIN
            ? fc_types.Role.admin
            : fc_types.Role.user,
      );

      final fc_types.Room room = await _chatCore.createRoom(otherUser);
      return room;
    } catch (error) {
      // TODO
      throw Error();
    }
  }

  ///
  Future<void> updateProfilePhoto() async {
    final PickedFile? result = await ImagePicker().getImage(
      imageQuality: 70,
      maxWidth: 1440,
      // TODO: enable camera too, maybe show dialog, or its own widget
      source: ImageSource.gallery,
    );

    if (result != null) {
      final List<String> mimeType = lookupMimeType(result.path)!.split('/');
      final MultipartFile file = await MultipartFile.fromPath(
        'profilePhoto',
        result.path,
        contentType: MediaType(mimeType[0], mimeType[1]),
      );
      /*
       final MultipartFile file = MultipartFile.fromBytes(
        'profilePhoto',
        await result.readAsBytes(),
        contentType: MediaType(mimeType[0], mimeType[1]),
      );
      * */
      final FileDescription info = FileDescription(
        name: "${user.username}_profile_photo",
        alternativeText: "${user.username} profile's photo.",
        caption: "${_profile.fullName} beautiful profile's photo.",
      );
      try {
        final UploadFile updatedProfilePhoto =
            await _uploadFileRepository.uploadFile(
          fileInfo: info,
          file: file,
        );

        final Profile fetchedUpdatedProfile =
            await _profileRepository.updateProfilePhoto(
          profileId: _profile.id!,
          photoId: updatedProfilePhoto.id!,
        );

        final User updatedUser =
            _currentUser!.copyWith(profile: fetchedUpdatedProfile);
        _userController.state = updatedUser;
        state = const ProfileState.data();
      } on Exception catch (error) {}
    } else {}
  }

  ///
  Future<void> updateProfile(Map<String, dynamic> validFields) async {
    try {
      final Profile updatedFields = Profile.fromJson(validFields);

      final Profile fetchedUpdatedProfile =
          await _profileRepository.updateProfile(
        updatedProfile: updatedFields.copyWith(
          id: _profile.id,
          role: _profile.role,
          uid: _profile.uid,
        ),
      );

      _chatRepository.registerUser(fetchedUpdatedProfile);

      final User updatedUser =
          _currentUser!.copyWith(profile: fetchedUpdatedProfile);
      _userController.state = updatedUser;

      state = const ProfileState.data();
    } catch (error) {}
  }

  ///
  Future<void> init() async {
    postsCount = await _profileRepository.countPotsByUser(userId: user.id);
    if (user.profile != null) {
      state = const ProfileState.data();
    } else {
      state = const ProfileState.error("The user has no a valid profile");
    }
  }
}
