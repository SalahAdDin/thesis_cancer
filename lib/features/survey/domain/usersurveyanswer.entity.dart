import 'package:freezed_annotation/freezed_annotation.dart';

part 'usersurveyanswer.entity.freezed.dart';
part 'usersurveyanswer.entity.g.dart';

@freezed
class UserSurveyAnswer with _$UserSurveyAnswer {
  const factory UserSurveyAnswer(
      {required String id,
      required String userId,
      required String surveyId,
      required Map<String, dynamic> answers,
      required int iteration}) = _UserSurveyAnswer;

  factory UserSurveyAnswer.fromJson(Map<String, dynamic> json) =>
      _$UserSurveyAnswerFromJson(json);
// static const empty = UserSurveyAnswer(id: id, userId: userId, surveyId: surveyId, answers: answers, iteration: iteration)
}
