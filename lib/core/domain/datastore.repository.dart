import 'package:thesis_cancer/features/survey/domain/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/usersurveyanswer.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

abstract class DataStoreRepository {
  // User profile
  Future<void> writeUserProfile(User user);

  Future<void> removeUserProfile();

  Stream<User> userProfileData();

  Future<User> getUserProfileData();

  Future<bool> doesExistUserProfileWithUserName(String username);

  // Surveys

  Future<List<Survey>> getSurveys();

  Future<void> removeSurveys();

  Stream<Survey> surveysData();

  // Survey

  Future<void> writeSurvey(Survey survey);

  Future<void> removeSurvey(String id);

  Stream<Survey> surveyData(String id);

  Future<Survey> getSurvey(String id);

  Future<bool> doesExistSurveyWithId(String id);

  //Survey answers
  Future<void> writeSurveyResult(UserSurveyAnswer surveyAnswer);

  Future<void> removeSurveyResult(String id);

  Stream<List<UserSurveyAnswer>> userSurveyAnswersData();

  Stream<List<UserSurveyAnswer>> userSurveyAnswersByUserData(String userId);

  Stream<List<UserSurveyAnswer>> userSurveyAnswersBySurveyData(String surveyId);

  Future<List<UserSurveyAnswer>> getSurveyAnswerBySurveyId(String id);

  Future<List<UserSurveyAnswer>> getSurveyAnswerByUserId(String id);

  Future<bool> doesExistSurveyAnswerBySurveyId(String id);

  Future<bool> doesExistSurveyAnswerByUserId(String id);
}
