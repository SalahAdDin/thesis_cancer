/// GraphQL Fragment containing the fetching required attributes for [UploadFIle] query/mutation.
const String graphQLFragmentBody = '''
fragment UploadFileFields on UploadFile {
  id
  alternativeText
  caption
  width
  height
  url
  previewUrl
  mime
}
''';
