// TODO: delete, update, create return user, we can compare returned users to check success.

// fragment: body
String graphQLFragmentBody = '''fragment UserFields on User {
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
  posts
  comments
  likes
}
''';

/*
*
        photo{
          url
          description
        }
        * */
String graphQLDocumentGetUser = '''
  $graphQLFragmentBody
  query GetUser(\$id: ID!) {
    getUser(id: \$id) {
      ...UserFields
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
  mutation CreateUserInput(
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
mutation DeleteUserInput(\$id: ID!){
  deleteUser(id: \$id){
    id
  }
}
''';

String graphQLDocumentUpdateUser = '''
  $graphQLFragmentBody
  mutation UpdateUserInput(
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
subscription OnCreateUser(\$id: ID!) {
  createdUser(id: \$id) {
    id
    email
  }
}
''';
