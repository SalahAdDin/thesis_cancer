import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.entity.freezed.dart';
part 'answer.entity.g.dart';

@freezed
class UserSurveyAnswer with _$UserSurveyAnswer {
  const factory UserSurveyAnswer({
    // String? id,
    required String statement,
    required String answer,
  }) = _UserSurveyAnswer;

  factory UserSurveyAnswer.fromJson(Map<String, dynamic> json) =>
      _$UserSurveyAnswerFromJson(json);
  static const empty = UserSurveyAnswer(statement: '', answer: '');
}
