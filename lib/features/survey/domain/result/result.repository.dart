import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';

abstract class UserSurveyResultRepository {
  /*
  Future<List<UserSurveyResult>> findAll();

  Future<List<UserSurveyResult>> findBySurveyId(String id);

  Future<List<UserSurveyResult>> findByUserId(String id);

  Future<List<UserSurveyResult>> findBySurveyAndUserId(
      String surveyId, String userId);

  Future<UserSurveyResult> findById(String id);

  Future<void> removeUserSurveyResult(String userSurveyResultId);
  */

  Future<int> countUserSurveyResults(String userId, String surveyId);

  Future<dynamic> createUserSurveyResult(UserSurveyResult userSurveyResult);
}
