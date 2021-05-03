String graphQLFragmentFullBody = '''fragment ResultFields on UserSurveyResult{
  id
  createdAt
  iteration
  surveyID
  userID
  answers {
    items {
      answer
      id
      questionID
      userSurveyResultID
    }
  }
}
''';

String graphQLFragmentListBody = '''fragment ResultFields on UserSurveyResult{
  id
  createdAt
  iteration
  surveyID
  userID
}
''';

String graphQLDocumentGetUserSurveyResult = '''
  $graphQLFragmentFullBody
  query GetUserSurveyResult(\$id: ID!){
    getUserSurveyResult(id: \$id){
      ...ResultFields
    }
  }
''';

String graphQLDocumentListUserSurveyResults = '''
$graphQLFragmentListBody
query ListUserSurveyResults {
  listUserSurveyResults {
    items {
      ...ResultFields
    }
  }
}
''';

// TOD: are "" required?
String graphQLFilterResultBySurvey(String surveyId) =>
    '{surveyID: {eq: "$surveyId"}}';

String graphQLFilterResultByUser(String userId) => '{userID: {eq: "$userId"}}';

String graphQLFilterResultBySurveyAndUser(String surveyId, String userId) =>
    '{surveyID: {eq: "$surveyId"}, userID: {eq: "$userId"}}';

String graphQLDocumentListFilteredResults = '''
$graphQLFragmentListBody
query ListFilteredResults{
  listUserSurveyResults(filter: \$filter) {
    items {
      ...ResultFields
    }
  }
}
''';

String graphQLDocumentCreateUserSurveyResult = '''
  $graphQLFragmentListBody
  mutation CreateUserSurveyResult(
    \$id: ID,
    \$userID: ID!,
    \$surveyID: ID!,
    \$iteration: Int
  ){
    createUserSurveyResult(input: {
      id: \$id, 
      iteration: \$iteration, 
      surveyID: \$surveyID, 
      userID: \$userID
    }) {
      ...ResultFields
    }
  }
''';

String graphQLDocumentDeleteUserSurveyResult = '''
mutation DeleteUserSurveyResult(\$id: ID!){
  deleteUserSurveyResult(input: {id: \$id}) {
    id
  }
}
''';

String graphQLDocumentOnCreateUserSurveyResult = '''
subscription OnCreateUserSurveyResult {
  onCreateUserSurveyResult {
    id
    surveyID
    userID
  }
}
''';
