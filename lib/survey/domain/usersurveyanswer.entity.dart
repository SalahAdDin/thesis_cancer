class UserSurveyAnswer {
  final String id;
  final String userID;
  final String surveyID;
  final String questionID;
  final String answer;

  const UserSurveyAnswer(
      {this.id, this.userID, this.surveyID, this.questionID, this.answer});
}
