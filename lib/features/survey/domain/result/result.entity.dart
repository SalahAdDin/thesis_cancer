import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';

part 'result.entity.freezed.dart';
part 'result.entity.g.dart';

@freezed
class UserSurveyResult with _$UserSurveyResult {
  const factory UserSurveyResult({
    required String id,
    required String userID,
    required String surveyID,
    required List<UserSurveyAnswer> answers,
    required int iteration,
    DateTime? createdAt,
  }) = _UserSurveyResult;

  factory UserSurveyResult.fromJson(Map<String, dynamic> json) =>
      _$UserSurveyResultFromJson(json);
}
