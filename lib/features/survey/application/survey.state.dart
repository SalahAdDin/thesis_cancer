import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';

part 'survey.state.freezed.dart';

@freezed
class SurveyState with _$SurveyState {
  const factory SurveyState.loading() = _Loading;

  /*
  const factory SurveyState.currentQuestion(Question question) =
      _CurrentQuestion;
  */

  const factory SurveyState.data([int? index]) = _Data;

  const factory SurveyState.completed() = _Completed;

  const factory SurveyState.error([Failure? error]) = _Error;
}
