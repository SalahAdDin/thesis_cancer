/// GraphQL Fragment containing the fetching required attributes for our query/mutation.
String graphQLFragmentBody = '''
fragment ResultFields on Result {
  id
  iteration
  answers {
    id
    answer
    statement
  }
}
''';

///
String graphQLDocumentGetResult = '''
  $graphQLFragmentBody
  query GetResult(\$id: ID!){
    getResult(id: \$id){
      ...ResultFields
    }
  }
''';

///
String graphQLDocumentListResults = '''
$graphQLFragmentBody
query ListResults {
  listResults {
    items {
      ...ResultFields
    }
  }
}
''';

///
String graphQLFilterResultBySurvey(String surveyId) =>
    '{surveyID: {eq: "$surveyId"}}';

///
String graphQLFilterResultByUser(String userId) => '{userID: {eq: "$userId"}}';

///
String graphQLFilterResultBySurveyAndUser(String surveyId, String userId) =>
    '{surveyID: {eq: "$surveyId"}, userID: {eq: "$userId"}}';

///
String graphQLDocumentListFilteredResults = '''
$graphQLFragmentBody
query ListFilteredResults{
  listResults(filter: \$filter) {
    items {
      ...ResultFields
    }
  }
}
''';

///
String graphQLDocumentCountResults = '''
query CountResults(
  \$surveyID: ID!,
  \$userID: ID!
){
  resultsCount(where: { survey: \$surveyID, user: \$userID })
}
''';

///
String graphQLDocumentCreateResult = '''
  $graphQLFragmentBody
  mutation CreateResult(
    \$data: ResultInput
  ){
    createResult(input: {
      data: \$data
    }) {
      result {
        ...ResultFields
      }
    }
  }
''';

///
String graphQLDocumentDeleteResult = '''
mutation DeleteResult(\$id: ID!){
  deleteResult(input: {id: \$id}) {
    id
  }
}
''';

///
String graphQLDocumentOnCreateResult = '''
subscription OnCreateResult {
  onCreateResult {
    id
    surveyID
    userID
  }
}
''';
