const String graphQLFragmentBody = '''
fragment SurveyFields on Survey {
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

const String graphQLDocumentGetSurvey = '''
  $graphQLFragmentBody
  query GetSurvey(\$id: ID!) {
    survey(id: \$id) {
      ...SurveyFields
    }
  }
''';

const String graphQLDocumentListSurveys = '''
  $graphQLFragmentBody
  query ListSurveys {
    surveys {
      ...SurveyFields
    }
  }
''';

const String graphQLDocumentCreateSurvey = '''
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

const String graphQLDocumentDeleteSurvey = '''
  mutation DeleteSurvey(\$id: ID!){
    deleteSurvey(input: {id: \$id}) {
      id
    }
  }
''';

const String graphQLDocumentUpdateSurvey = '''
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

const String graphQLDocumentOnCreateSurvey = '''
subscription OnCreateSurvey {
  onCreateSurvey {
    id
    title
  }
}
''';
