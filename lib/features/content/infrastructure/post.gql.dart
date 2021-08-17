import 'package:thesis_cancer/features/user/infrastructure/user.gql.dart'
    as user_gql;

/// GraphQL Fragment containing the fetching required attributes for [Post] query/mutation.
const String graphQLFragmentBody = '''
${user_gql.graphQLFragmentBody}
fragment PostFields on Post {
  id
  createdAt
  type
  author {
    ...UserFields
  }
  title
  description
  gallery {
    ...UploadFileFields
  }
}
''';

///
const String graphQLDocumentGetPost = '''
$graphQLFragmentBody
query getPost(\$id:ID!){
  post(id: \$id){
    ...PostFields
  }
}
''';

///
const String graphQLDocumentListPosts = '''
$graphQLFragmentBody
query ListPosts{
  posts{
    ...PostFields
  }
}
''';

///
// start: 0, limit: 5, sort: "createdAt:desc"
const String graphQLDocumentListPostsByContentType = '''
$graphQLFragmentBody
query ListPostsByContentType(\$contentType: ContentType!) {
  posts(where: { type: \$contentType }, sort: "createdAt:desc") {
    ...PostFields
  }
}
''';

///
const String graphQLDocumentListPostsByUserId = '''
$graphQLFragmentBody
query ListPostsByUserId(\$id: ID!) {
  posts(where: { author: \$id }) {
    ...PostFields
  }
}
''';

///
const String graphQLDocumentCreatePost = '''
$graphQLFragmentBody
mutation CreatePost(\$data: PostInput) {
  createPost(input: { data: \$data }) {
    post {
      ...PostFields
    }
  }
}
''';

///
const String graphQLDocumentDeletePost = r'''
mutation DeletePost($id: ID!) {
  deletePost(input: { where: { id: $id } }){
    post{
      id
    }
  }
}
''';

///
const String graphQLDocumentUpdatePost = '''
$graphQLFragmentBody
mutation UpdatePost(\$id: ID!, \$data: editPostInput) {
  updatePost(input: { where: { id: \$id }, data: \$data }) {
    post {
      ...PostFields
    }
  }
}
''';
