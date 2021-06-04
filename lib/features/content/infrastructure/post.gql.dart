const String graphQLFragmentBody = '''
fragment PostFields on Post {
  id
  createdAt
  type
  description
  title
  gallery {
    alternativeText
    caption
    width
    height
    url
    previewUrl
  }
}
''';

const String graphQLDocumentGetPost = '''
$graphQLFragmentBody
query getPost(\$id:ID!){
  post(id: \$id){
    ...PostFields
  }
}
''';

const String graphQLDocumentListPosts = '''
$graphQLFragmentBody
query ListPosts{
  posts{
    ...PostFields
  }
}
''';

// start: 0, limit: 5, sort: "created_at:desc"
const String graphQLDocumentListPostsByContentType = '''
$graphQLFragmentBody
query ListPostsByContentType(\$contentType: ContentType!) {
  posts(where: { type: \$contentType }, sort: "created_at:desc") {
    ...PostFields
  }
}
''';

const String graphQLDocumentListPostsByUserId = '''
$graphQLFragmentBody
query ListPostsByUserId(\$id: ID!) {
  posts(where: { author: \$id }) {
    ...PostFields
  }
}
''';

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

const String graphQLDocumentDeletePost = r'''
mutation DeletePost($id: ID!) {
  deletePost(input: { where: { id: $id } }){
    post{
      id
    }
  }
}
''';

String graphQLDocumentUpdatePost = '''
$graphQLFragmentBody
mutation UpdatePost(\$id: ID!, \$data: editPostInput) {
  updatePost(input: { where: { id: \$id }, data: \$data }) {
    post {
      ...PostFields
    }
  }
}
''';
