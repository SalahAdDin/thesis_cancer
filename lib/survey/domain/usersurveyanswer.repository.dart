import 'package:thesis_cancer/survey/domain/usersurveyanswer.entity.dart';

abstract class UserSurveyAnswerRepository {
  Future<List<UserSurveyAnswer>> findAll();
  Future<List<UserSurveyAnswer>> findByQuestionId(String id);
  Future<List<UserSurveyAnswer>> findBySurveyId(String id);
  Future<List<UserSurveyAnswer>> findByUserId(String id);
  Future<List<UserSurveyAnswer>> findBySurveyAndUserId(
      String surveyId, String userId);
  Future<List<UserSurveyAnswer>> findBySurveyAndQuestionId(
      String surveyId, String questionId);
  Future<UserSurveyAnswer> findById(String id);
  Future<UserSurveyAnswer> createUserAnswer(UserSurveyAnswer userSurveyAnswer);
  Future<void> removeUserAnswer(UserSurveyAnswer userSurveyAnswer);
  Future<UserSurveyAnswer> updateUserAnswer(UserSurveyAnswer userSurveyAnswer);
}
