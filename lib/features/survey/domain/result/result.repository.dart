import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';

/// [UserSurveyResult] Interface
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

  /// Gets the number of results related to a [User] and [Survey].
  /// This value will be used to get the [UserSurveyResult]'s iteration.
  Future<int> countUserSurveyResults({
    required String userId,
    required String surveyId,
  });

  ///
  Future<dynamic> createUserSurveyResult(UserSurveyResult userSurveyResult);
}
