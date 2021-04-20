import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/survey/domain/question.entity.dart';

part 'survey.state.freezed.dart';

@freezed
class SurveyState with _$SurveyState {
  const factory SurveyState.loading() = _Loading;

/*  const factory SurveyState.currentQuestion(Question question) =
      _CurrentQuestion;*/

  const factory SurveyState.data() = _Data;

  const factory SurveyState.completed() = _Completed;

  const factory SurveyState.error(String error) = _Error;
}
