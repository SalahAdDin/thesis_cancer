const String graphQLFragmentBody =
    r'''fragment AuthFields on UsersPermissionsLoginPayload {
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
        \$provider: String,
    ) {
  login(input: { identifier: \$identifier, password: \Spassword, provider: \$provider }) {
    ...AuthFields
  }
}
''';

const String graphQLDocumentForgotPassword = r'''
mutation ForgotPassword(\$email: String!) {
    forgotPassword(input: { email: \$email }) {
        ok
    } 
}
''';

const String graphQLDocumentResetPassword = '''
    $graphQLFragmentBody
mutation ResetPassword(
    \$password: String!,
    \$passwordConfirmation: String!,
    \$code: String!
) {
    resetPassword(input: {
    password: \$password,
    passwordConfirmation: \$passwordConfirmation
    code: \$code}
    ) {
        ...AuthFields
    }
}
''';
