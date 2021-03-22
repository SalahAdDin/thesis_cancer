import 'package:thesis_cancer/utils/types.dart';

class Question {
  final String id;
  final String statement;
  final QuestionType type;
  final String anwser;
  final String surveyID;

  const Question(
      {this.id, this.statement, this.type, this.anwser, this.surveyID});
}
