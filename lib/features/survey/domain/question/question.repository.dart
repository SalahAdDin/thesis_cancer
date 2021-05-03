import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';

abstract class QuestionRepository {
  Future<List<Question>> findAll();

  Future<List<Question>> findBySurveyId(String id);

  Future<Question> findById(String id);

  Future<Question> createQuestion(Question question);

  Future<void> removeQuestion(String questionId);

  Future<Question> updateQuestion(Question question);
}
