import 'package:thesis_cancer/features/survey/domain/survey.entity.dart';

abstract class SurveyRepository {
  Future<List<Survey>> findAll();

  Future<Survey> findById(String id);

  Future<Survey> createSurvey(Survey survey);

  Future<void> removeSurvey(Survey survey);

  Future<Survey> updateSurvey(Survey survey);
}
