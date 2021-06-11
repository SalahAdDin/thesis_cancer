import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

abstract class ProfileRepository {
  Future<Profile> findById(String profileId);

  Future<Profile> findByUserId(String userId);

  Future<Profile> updateProfile({
    required String profileId,
    required Profile updatedProfile,
  });

  Future<UploadFile> uploadProfilePhoto(UploadFile profilePhoto);
}
