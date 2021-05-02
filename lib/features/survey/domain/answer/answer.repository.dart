import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';

/*
* As all survey answer will get by the UserSurveyResult model,
* most of this queries are not required.
* As the answers will be immutable, they will just be created or removed.
* */

abstract class UserSurveyAnswerRepository {
/*  Future<List<UserSurveyAnswer>> findAll();

  Future<List<UserSurveyAnswer>> findByQuestionId(String id);

  Future<List<UserSurveyAnswer>> findBySurveyId(String id);

  Future<List<UserSurveyAnswer>> findByUserId(String id);

  Future<List<UserSurveyAnswer>> findBySurveyAndUserId(
      String surveyId, String userId);

  Future<List<UserSurveyAnswer>> findBySurveyAndQuestionId(
      String surveyId, String questionId);

  Future<UserSurveyAnswer> findById(String id);*/

  Future<UserSurveyAnswer> createUserAnswer(UserSurveyAnswer userSurveyAnswer);

  Future<void> removeUserAnswer(String userSurveyAnswerId);

// Future<UserSurveyAnswer> updateUserAnswer(UserSurveyAnswer userSurveyAnswer);
}
