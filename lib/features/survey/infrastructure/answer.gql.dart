String graphQLFragmentBody = '''fragment AnswerFields on UserSurveyAnswer {
  id
  answer
  questionID
  userSurveyResultID
}
''';

String graphQLDocumentCreateUserSurveyAnswer = '''
  $graphQLFragmentBody
  mutation CreateUserSurveyAnswer(
    \$id: ID,
    \$userSurveyResultID: ID!,
    \$questionID: ID!,
    \$answer: String!
  ){
    createUserSurveyAnswer(input: {
    answer: \$answer, 
    id: \$id, 
    questionID: \$questionID, 
    userSurveyResultID: \$userSurveyResultID
    }) {
      ...AnswerFields
    }
  }
 ''';

String graphQLDocumentDeleteSurveyAnswer = '''
  $graphQLFragmentBody
  mutation DeleteUserSurveyAnswer(\$id: ID!){
    deleteUserSurveyAnswer(input: {id: "\$id"}) {
      id
    }
  }
 ''';
