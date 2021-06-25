import 'package:thesis_cancer/features/media/infrastructure/upload_file.gql.dart'
    as upload_file;

/// GraphQL Fragment containing the fetching required attributes for [Profile] query/mutation.
const String graphQLFragmentBody = '''
${upload_file.graphQLFragmentBody}
fragment ProfileFields on Profile {
  id
  createdAt
  firstName
  lastName
  profilePhoto {
    ...UploadFileFields
  }
  role
  phoneNumber
  hasSeenTutorial
  hasSeenIntroductoryVideo
  bio
}
''';

///
const String graphQLDocumentGetProfile = '''
query GetProfileById(\$id: ID!){
  profile(id: \$id){
    ...ProfileFields
  }
}
''';

///
const String graphQLDocumentGetProfileByUserId = '''
$graphQLFragmentBody
query GetProfileByUserId(\$userId: ID!) {
  profiles(where: { user: \$userId }) {
    ...ProfileFields
  }
}
''';

///
const String graphQLDocumentUpdateProfile = '''
$graphQLFragmentBody
mutation UpdateProfile(\$id: ID!, \$data: editProfileInput) {
  updateProfile(input: { where: { id: \$id }, data: \$data }) {
    profile {
      ...ProfileFields
    }
  }
}
''';

///
const String graphQLDocumentListProfiles = '''
$graphQLFragmentBody
query ListProfiles {
  profiles{
    ...ProfileFields
  }
}
''';
