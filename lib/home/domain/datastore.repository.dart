import 'package:thesis_cancer/survey/domain/survey.entity.dart';
import 'package:thesis_cancer/survey/domain/usersurveyanswer.entity.dart';
import 'package:thesis_cancer/user/domain/user.entity.dart';

abstract class DataStoreRepository {
  Future<void> writeUserProfile(User user);

  Future<void> removeUserProfile();

  Stream<User> userProfileData();

  Future<User> getUserProfileData();

  Future<bool> doesExistUserProfileWithUserName(String username);
}
