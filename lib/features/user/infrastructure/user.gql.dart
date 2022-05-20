import 'package:thesis_cancer/features/user/infrastructure/profile.gql.dart'
    as profile;

/// GraphQL Fragment containing the fetching required attributes for [User] query/mutation.
const String graphQLFragmentBody = '''
${profile.graphQLFragmentBody}
fragment UserFields on UsersPermissionsUser {
  id
  createdAt
  username
  email
  profile{
    ...ProfileFields
  }
}
''';

///
String graphQLFragmentPost = '''
fragment PostFields on User {
  posts {
    id
    gallery(limit: 1) {
    ...UploadFileFields
    }
  }
}
''';

///
String graphQLFragmentSurveyResult = '''
fragment SurveyFields on User {
  surveyResults {
    iteration
    createdAt
    answers {
      id
      answer
      statement
    }
  }
}
''';

///
String graphQLDocumentGetUser = '''
  $graphQLFragmentBody
  query GetUser(\$id: ID!) {
    user(id: \$id) {
      ...UserFields
    }
  }
''';

///
const String graphQLDocumentFindUsers = '''
$graphQLFragmentBody
query FindUsers(\$where: JSON) {
  users(where: \$where) {
    ...UserFields
  }
}
''';

// photo url
// comments count
// posts count
// likes count
///
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

///
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

///
String graphQLDocumentDeleteUser = '''
mutation DeleteUser(\$id: ID!){
  deleteUser(input: {id: \$id}){
    id
  }
}
''';

///
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

///
String graphQLDocumentOnCreateUser = '''
subscription OnCreateUser {
  onCreateUser {
    id
    email
  }
}
''';
