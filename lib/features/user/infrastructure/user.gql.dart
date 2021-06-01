// TODO: delete, update, create return user, we can compare returned users to check success.

// fragment: body
String graphQLFragmentBody = '''
fragment UserFields on User {
  id
  email
  displayName
  role
  phoneNumber
  isConfirmed
  isLoggedIn
  hasSeenTutorial
  hasSeenIntroductoryVideo
  darkMode
  bio
  gallery
  photo{
    url
    description
  }
}
''';

String graphQLFragmentPost = '''
fragment PostFields on User {
  posts {
    items {
      id
      media(limit: 1) {
        items {
          description
          id
          url
        }
      }
    }
  }
}
''';

String graphQLFragmentSurveyResult = '''
fragment SurveyFields on User {
  surveyResults {
    items {
      iteration
      createdAt
      answers {
        items {
          answer
          questionID
        }
      }
    }
  }
}
''';

String graphQLDocumentGetUser = '''
  $graphQLFragmentBody
  $graphQLFragmentPost
  $graphQLFragmentSurveyResult
  query GetUser(\$id: ID!) {
    getUser(id: \$id) {
      ...UserFields
      ...PostFields
      ...SurveyFields
    }
  }''';

// photo url
// comments count
// posts count
// likes count
String graphQLDocumentListUsers = '''
query ListUsers {
  listUsers {
    items {
      id
      email
      displayName
      role
      phoneNumber
      isConfirmed
    }
    nextToken
  }
}''';

String graphQLDocumentCreateUser = '''
  $graphQLFragmentBody
  mutation CreateUser(
    \$id: ID, 
    \$email: String!, 
    \$displayName: String!, 
    \$role: UserRole!,  
    \$phoneNumber: String,  
    \$isConfirmed: Boolean,  
    \$hasSeenTutorial: Boolean,  
    \$hasSeenIntroductoryVideo: Boolean,  
    \$darkMode: Boolean,  
    \$bio: String,  
    \$photoID: ID!
  ){
    createUser(input: {
      id: \$id,
      email: \$email, 
      displayName: \$displayName, 
      role: \$role,  
      phoneNumber: \$phoneNumber,  
      isConfirmed: \$isConfirmed,
      hasSeenTutorial: \$hasSeenTutorial,  
      hasSeenIntroductoryVideo: \$hasSeenIntroductoryVideo,  
      darkMode: \$darkMode,  
      bio: \$bio,  
      photoID: \$photoID
    }){
      ...UserFields
    }
  }
''';

String graphQLDocumentDeleteUser = '''
mutation DeleteUser(\$id: ID!){
  deleteUser(input: {id: \$id}){
    id
  }
}
''';

String graphQLDocumentUpdateUser = '''
  $graphQLFragmentBody
  mutation UpdateUser(
    \$id: ID!, 
    \$email: String, 
    \$displayName: String, 
    \$role: UserRole,  
    \$phoneNumber: String,  
    \$isConfirmed: Boolean,  
    \$hasSeenTutorial: Boolean,  
    \$hasSeenIntroductoryVideo: Boolean,  
    \$darkMode: Boolean,  
    \$bio: String,  
    \$photoID: ID
  ){
    updateUser(input: {
      id: \$id,
      email: \$email, 
      displayName: \$displayName, 
      role: \$role,  
      phoneNumber: \$phoneNumber,  
      isConfirmed: \$isConfirmed,
      hasSeenTutorial: \$hasSeenTutorial,  
      hasSeenIntroductoryVideo: \$hasSeenIntroductoryVideo,  
      darkMode: \$darkMode,  
      bio: \$bio,  
      photoID: \$photoID
    }){
      ...UserFields
    }
  }
''';

String graphQLDocumentOnCreateUser = '''
subscription OnCreateUser {
  onCreateUser {
    id
    email
  }
}
''';
