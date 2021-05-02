import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.entity.freezed.dart';
part 'answer.entity.g.dart';

@freezed
class UserSurveyAnswer with _$UserSurveyAnswer {
  const factory UserSurveyAnswer(
      {required String id,
      required String userSurveyResultID,
      required String questionID,
      required String answer}) = _UserSurveyAnswer;

  factory UserSurveyAnswer.fromJson(Map<String, dynamic> json) =>
      _$UserSurveyAnswerFromJson(json);
// static const empty = UserSurveyAnswer(id: id, userId: userId, surveyId: surveyId, answers: answers, iteration: iteration)
}
