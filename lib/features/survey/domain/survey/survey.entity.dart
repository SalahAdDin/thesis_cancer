import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';

part 'survey.entity.freezed.dart';
part 'survey.entity.g.dart';

////
@freezed
class Survey with _$Survey {
  ///
  const factory Survey({
    required String id,
    required String title,
    DateTime? createdAt,
    String? intro,
    List<Question>? questions,
  }) = _Survey;

  ///
  factory Survey.fromJson(Map<String, Object?> json) => _$SurveyFromJson(json);

  ///
  static const Survey empty = Survey(id: '', title: 'Mock Survey');
}
