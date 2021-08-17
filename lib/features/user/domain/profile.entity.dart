import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

part 'profile.entity.freezed.dart';
part 'profile.entity.g.dart';

/// User's Profile Entity
@freezed
class Profile with _$Profile {
  ///
  const factory Profile({
    String? id,
    String? firstName,
    String? lastName,
    UploadFile? profilePhoto,
    @Default(UserRole.GUEST) UserRole role,
    String? uid, // Firebase user id
    String? phoneNumber,
    bool? hasSeenTutorial,
    bool? hasSeenIntroductoryVideo,
    String? bio,
  }) = _Profile;

  const Profile._();

  ///Builds a [Profile] from a given json [String].
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  /// Builds a empty(dummy) [Profile].
  static const Profile empty = Profile(
    firstName: 'Dummy',
    lastName: 'Do',
  );

  ///
  String get shortName => firstName != null && lastName != null
      ? "${firstName!.split(" ")[0]} ${lastName!.split(" ")[0]}"
      : '';

  ///
  String get fullName =>
      firstName != null && lastName != null ? "$firstName $lastName" : '';
}
