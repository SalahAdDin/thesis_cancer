String graphQLFragmentBody = '''fragment QuestionFields on Question {
  answer
  id
  statement
  surveyID
  type
}
''';

String graphQLDocumentGetQuestion = '''
  $graphQLFragmentBody
  query GetQuestion(\$id: ID!) {
    getQuestion(id: \$id) {
      ...QuestionFields
    }
  }
''';

String graphQLDocumentListQuestions = '''
  $graphQLFragmentBody
  query ListQuestions {
    listQuestions {
      items {
        ...QuestionFields
      }
    }
  }
''';

String graphQLFilterQuestionBySurvey(String surveyId) =>
    '{surveyID: {eq: "$surveyId"}}';

String graphQLDocumentListFilteredQuestions = '''
  $graphQLFragmentBody
  query ListFilteredQuestions {
    listQuestions(filter: \$filter) {
      items {
        ...QuestionFields
      }
    }
  }
''';

String graphQLDocumentCreateQuestion = '''
  $graphQLFragmentBody
  mutation CreateQuestion(  
    \$id: ID,
    \$statement: String!,
    \$type: QuestionType!,
    \$answer: String,
    \$surveyID: ID!
  ) {
    createQuestion(input: {
      answer: \$answer, 
      id: \$id, 
      statement: \$statement,
      surveyID: \$surveyID, 
      type: \$type
     }) {
      ...QuestionFields
    }
  }
''';

String graphQLDocumentDeleteQuestion = '''
  mutation DeleteQuestion(\$id: ID!){
    deleteQuestion(input: {id: \$id}){
      id
    }
  }
''';

String graphQLDocumentUpdateQuestion = '''
  $graphQLFragmentBody
  mutation UpdateQuestion(  
    \$id: ID!,
    \$statement: String,
    \$type: QuestionType,
    \$answer: String,
    \$surveyID: ID
  ) {
    updateQuestion(input: {
      answer: \$answer, 
      id: \$id, 
      statement: \$statement,
      surveyID: \$surveyID, 
      type: \$type
     }){
      ...QuestionFields
    }
  }
''';
