import 'package:thesis_cancer/user/domain/user.entity.dart';

abstract class DataStoreRepository {
  Future<void> createUserProfile(User user);
  Stream<User> userProfileData();
  Future<User> getUserProfileData();
  Future<bool> doesExistUserProfileWithUserName(String username);
}
