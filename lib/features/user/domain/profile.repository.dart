import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

/// [Profile] Repository Interface
abstract class ProfileRepository {
  ///
  Future<Profile> findById(String profileId);

  ///
  Future<Profile> findByUserId(String userId);

  /// Gets the number of posts related to a [User].
  Future<int> countPostsByUser({required String userId});

  /// Updates [Profile] information ignoring the profile photo,
  /// which will be handled in another function.
  Future<Profile> updateProfile({
    required Profile updatedProfile,
  });

  /// __GraphQL__ with __Strapi__ requires to handle [UploadFile]s in a specific way,
  /// so, it will be handled by this function.
  Future<Profile> updateProfilePhoto({
    required String profileId,
    required String photoId,
  });

  ///
  Future<List<Profile>>? findProfilesWithQuery({
    required Map<String, dynamic> query,
  });
}
