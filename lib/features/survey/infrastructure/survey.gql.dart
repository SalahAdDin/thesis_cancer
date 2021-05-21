String graphQLFragmentBody = '''fragment SurveyFields on Survey {
  id
  title
  createdAt
  intro
  questions {
    id
    statement
    type
    answer
  }
}
''';

String graphQLDocumentGetSurvey = '''
  $graphQLFragmentBody
  query GetSurvey(\$id: ID!) {
    getSurvey(id: \$id) {
      ...SurveyFields
    }
  }
''';

String graphQLDocumentListSurveys = '''
  $graphQLFragmentBody
  query ListSurveys {
    surveys {
      items {
        ...SurveyFields
      }
    }
  }
''';

String graphQLDocumentCreateSurvey = '''
  $graphQLFragmentBody
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
  $graphQLFragmentBody
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

String graphQLDocumentOnCreateSurvey = '''
subscription OnCreateSurvey {
  onCreateSurvey {
    id
    title
  }
}
''';
