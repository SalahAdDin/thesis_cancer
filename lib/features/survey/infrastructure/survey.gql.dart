String graphQLFragmentListBody = '''fragment SurveyFields on Survey {
  createdAt
  id
  intro
  title
}
''';

String graphQLFragmentFullBody = '''fragment SurveyFields on Survey {
  createdAt
  id
  intro
  title
  questions {
    items {
      answer
      id
      statement
      type
      surveyID
    }
  }
}
''';

String graphQLDocumentGetSurvey = '''
  $graphQLFragmentFullBody
  query GetSurvey(\$id: ID!) {
    getSurvey(id: \$id) {
      ...SurveyFields
    }
  }
''';

String graphQLDocumentListSurveys = '''
  $graphQLFragmentListBody
  query ListSurveys {
    listSurveys {
      items {
        ...SurveyFields
      }
    }
  }
''';

String graphQLDocumentCreateSurvey = '''
  $graphQLFragmentListBody
  mutation CreateSurvey(
    \$id: ID,
    \$title: String!,
    \$intro: String
  ) {
    createSurvey(input: {
      id: \$id, 
      intro: \$intro, 
      title: \$title
    }) {
      ...SurveyFields
    }
  }
''';

String graphQLDocumentDeleteSurvey = '''
  mutation DeleteSurvey(\$id: ID!){
    deleteSurvey(input: {id: \$id}) {
      id
    }
  }
''';

String graphQLDocumentUpdateSurvey = '''
  $graphQLFragmentListBody
  mutation UpdateQuestion(
    \$id: ID!,
    \$title: String,
    \$intro: String
  ) {
    updateSurvey(input: {
      id: \$id, 
      intro: \$intro, 
      title: \$title
    }) {
      ...SurveyFields
    }
  }
''';
