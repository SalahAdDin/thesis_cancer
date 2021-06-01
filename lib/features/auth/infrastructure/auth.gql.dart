const String graphQLFragmentBody = '''
fragment AuthFields on UsersPermissionsLoginPayload {
  jwt
  user {
    id
    username
    email
    confirmed
  }
}
''';

const String graphQLDocumentRegisterUser = '''
    $graphQLFragmentBody
    mutation RegisterUser(
        \$username: String!,
        \$email: String!,
        \$password: String!
    ){
  register(input: { username: \$username, email: \$email, password: \$password }) {
    ...AuthFields
  }
}
''';

const String graphQLDocumentLoginUser = '''
    $graphQLFragmentBody
    mutation LoginUser(
        \$identifier: String!,
        \$password: String!,
        \$provider: String = "local"
    ) {
  login(input: { identifier: \$identifier, password: \$password, provider: \$provider }) {
    ...AuthFields
  }
}
''';

const String graphQLDocumentForgotPassword = r'''
mutation ForgotPassword($email: String!) {
  forgotPassword(email: $email) {
    ok
  }
}
''';

const String graphQLDocumentResetPassword = '''
    $graphQLFragmentBody
mutation ResetPassword(
  \$password: String!
  \$passwordConfirmation: String!
  \$code: String!
) {
  resetPassword(
    password: \$password
    passwordConfirmation: \$passwordConfirmation
    code: \$code
  ) {
    ...AuthFields
  }
}
''';
