/// GraphQL Fragment containing the required attributes for ous query/mutation.
const String graphQLFragmentBody = '''
fragment ProfileFields on Profile {
  id
  createdAt
  firstName
  lastName
  profilePhoto {
    id
    alternativeText
    caption
    width
    height
    url
    previewUrl
    mime
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
