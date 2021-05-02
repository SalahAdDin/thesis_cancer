import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';

/*
* This model is aware of getting all user answers for a given survey on a given attempt.
*
* TODO: how to set the iteration count properly?
* */

abstract class UserSurveyResultRepository {
  Future<List<UserSurveyResult>> findAll();

  // GraphQL mutation to get just the count

  Future<List<UserSurveyResult>> findBySurveyId(String id);

  Future<List<UserSurveyResult>> findByUserId(String id);

  Future<List<UserSurveyResult>> findBySurveyAndUserId(
      String surveyId, String userId);

  Future<UserSurveyResult> findById(String id);

  Future<UserSurveyResult> createUserSurveyResult(
      UserSurveyResult userSurveyResult);

  Future<void> removeUserSurveyResult(String userSurveyResultId);
}
