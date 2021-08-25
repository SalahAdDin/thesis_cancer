import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:http/http.dart";
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:thesis_cancer/features/chat/application/chat.provider.dart';
import 'package:thesis_cancer/features/chat/domain/chat.repository.dart';
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';
import 'package:thesis_cancer/features/media/domain/file_description.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.repository.dart';
import 'package:thesis_cancer/features/media/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/application/profile.state.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';

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
  Future<void> updateProfilePhoto() async {
    final XFile? result = await ImagePicker().pickImage(
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
      } on FileFailure catch (error) {
        state = ProfileState.error(error);
      } on ProfileFailure catch (error) {
        state = ProfileState.error(error);
      } on Exception catch (_) {
        state = ProfileState.error(
          ProfileFailure(reason: ProfileFailureReason.unknown),
        );
      }
    } else {}
  }

  ///
  Future<void> updateProfile(Map<String, Object?> validFields) async {
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
    } on ProfileFailure catch (error) {
      state = ProfileState.error(error);
    } on Exception catch (_) {
      state = ProfileState.error(
        ProfileFailure(reason: ProfileFailureReason.unknown),
      );
    }
  }

  ///
  Future<void> init() async {
    try {
      postsCount = await _profileRepository.countPostsByUser(userId: user.id);
    } on ProfileFailure catch (_) {}
    if (user.profile != null) {
      state = const ProfileState.data();
    } else {
      state = ProfileState.error(
        ProfileFailure(reason: ProfileFailureReason.notValidProfile),
      );
    }
  }
}
