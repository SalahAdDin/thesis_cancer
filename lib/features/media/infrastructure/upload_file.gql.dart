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

///
const String graphQLDocumentDeleteFile = '''
$graphQLFragmentBody
mutation DeleteFile(\$fileId: ID!) {
  deleteFile(input: { where: { id: \$fileId } }) {
    file {
      ...UploadFileFields
    }
  }
}
''';

///
const String graphQLDocumentUploadFile = '''
$graphQLFragmentBody
mutation UploadFile(\$file: Upload!, \$info: FileInfoInput) {
  upload(file: \$file, info: \$info) {
    ...UploadFileFields
  }
}
''';

///
const String graphQLDocumentMultiUploadFile = '''
$graphQLFragmentBody
mutation MultiUploadFile(
  \$refId: ID
  \$ref: String
  \$field: String
  \$source: String
  \$files: [Upload]!
) {
  multipleUpload(
    refId: \$refId
    ref: \$ref
    field: \$field
    source: \$source
    files: \$files
  ) {
    ...UploadFileFields
  }
}
''';
