import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';

part 'question.entity.freezed.dart';
part 'question.entity.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String id,
    required String statement,
    required QuestionType type,
    String? answer,
    required String surveyID,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  static const empty = Question(
      id: '',
      statement: 'This is a dummy question!',
      type: QuestionType.BOOL,
      surveyID: '');
}
