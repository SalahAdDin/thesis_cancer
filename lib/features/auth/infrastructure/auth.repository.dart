import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/errors/extension.entity.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/auth.gql.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';

/// **GraphQL** implementation for [AuthRepository] interface
class GraphQLAuthRepository implements AuthRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLAuthRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  /// Injecting the required [GraphQLClient] by reading it from providers.
  GraphQLClient get client => reader(graphQLClientProvider);

  /// As the [GraphQL] response comes in a slightly different format,
  /// it is needed to "flat" it before to pass it to the [User]'s serialization function.
  Map<String, dynamic> flatAuthResponse({required Map<String, dynamic> data}) {
    final Map<String, dynamic> flattenResult =
        data['user'] as Map<String, dynamic>;
    flattenResult['token'] = data['jwt'];
    final Map<String, dynamic> result = flattenResult;

    return result;
  }

  Message extractMessage(GraphQLError graphQLError) {
    final Extension extension = Extension.fromJson(
      graphQLError.extensions!,
    );
    // As far as we understood, at Strapi, a formatted message always
    // will return a data and message attributes,
    // https://github.com/strapi/strapi/blob/master/packages/strapi-plugin-users-permissions/controllers/Auth.js
    return extension.dataMessage!;
  }

  @override
  Future<bool> forgotPassword({required String email}) async {
    try {
      final QueryOptions options = QueryOptions(
          document: gql(graphQLDocumentForgotPassword),
          variables: <String, dynamic>{
            "email": email,
          });
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
        if (graphQLError.message.contains("Bad Request")) {
          final String messageId = extractMessage(graphQLError).id;
          if (messageId == "Auth.form.error.email.format") {
            throw ForgotPasswordFailure(
                reason: ForgotPasswordFailureReason.invalidEmail);
          } else if (messageId == "Auth.form.error.user.not-exist") {
            throw ForgotPasswordFailure(
                reason: ForgotPasswordFailureReason.emailDoesNotExist);
          } else {
            throw ForgotPasswordFailure(
                reason: ForgotPasswordFailureReason.unknown);
          }
        } else {
          throw ResetPasswordFailure(
              reason: ResetPasswordFailureReason.unknown);
        }
      }
      final bool result = response.data?['forgotPassword']['ok'] as bool;

      return result;
    } on Exception catch (_) {
      throw ForgotPasswordFailure(reason: ForgotPasswordFailureReason.unknown);
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword({
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentResetPassword),
        variables: <String, dynamic>{
          "password": password,
          "passwordConfirmation": passwordConfirmation,
          "code": confirmationCode
        },
      );
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
        if (graphQLError.message.contains("Bad Request")) {
          final String messageId = extractMessage(graphQLError).id;
          if (messageId == "Auth.form.error.code.provide") {
            throw ResetPasswordFailure(
                reason: ResetPasswordFailureReason.incorrectCode);
          } else if (messageId == "Auth.form.error.password.matching") {
            throw ResetPasswordFailure(
                reason: ResetPasswordFailureReason.passwordsNoMatch);
          } else if (messageId == "Auth.form.error.params.provide") {
            throw ResetPasswordFailure(
                reason: ResetPasswordFailureReason.incorrectParams);
          } else {
            throw ResetPasswordFailure(
                reason: ResetPasswordFailureReason.unknown);
          }
        } else {
          throw ResetPasswordFailure(
              reason: ResetPasswordFailureReason.unknown);
        }
      }
      final Map<String, dynamic> data =
          response.data?['resetPassword'] as Map<String, dynamic>;

      return flatAuthResponse(data: data);
    } on Exception catch (_) {
      throw ResetPasswordFailure(reason: ResetPasswordFailureReason.unknown);
    }
  }

  @override
  Future<Map<String, dynamic>> signIn({
    required String identifier,
    required String password,
    String? provider,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
          document: gql(graphQLDocumentLoginUser),
          variables: <String, dynamic>{
            "identifier": identifier,
            "password": password,
            "provider": provider
          });
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
        if (graphQLError.message.contains("Bad Request")) {
          final String messageId = extractMessage(graphQLError).id;
          if (messageId == "Auth.form.error.invalid") {
            throw LogInFailure(
                reason: AuthFailureReason.invalidUsernamePassword);
          } else if (messageId == "Auth.form.error.confirmed") {
            throw LogInFailure(reason: AuthFailureReason.unconfirmedEmail);
          } else if (messageId == "Auth.form.error.blocked") {
            throw LogInFailure(reason: AuthFailureReason.blockedAccount);
          } else if (messageId == "Auth.form.error.password.local") {
            throw LogInFailure(reason: AuthFailureReason.localPassword);
          } else {
            throw LogInFailure(reason: AuthFailureReason.badRequest);
          }
        } else {
          throw LogInFailure(reason: AuthFailureReason.unknown);
        }
      }
      final Map<String, dynamic> data =
          response.data?['login'] as Map<String, dynamic>;

      return flatAuthResponse(data: data);
    } on Exception catch (_) {
      throw LogInFailure(reason: AuthFailureReason.unknown);
    }
  }

  @override
  Future<Map<String, dynamic>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentRegisterUser),
        variables: <String, dynamic>{
          'username': username,
          'email': email,
          'password': password
        },
      );
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
        if (graphQLError.message.contains("Bad Request")) {
          final String messageId = extractMessage(graphQLError).id;
          if (messageId == "Auth.advanced.allow_register") {
            throw SignUpFailure(
                reason: RegisterFailureReason.registeringActionNotAllowed);
          } else if (messageId == "Auth.form.error.password.format") {
            throw SignUpFailure(
                reason: RegisterFailureReason.moreThanThreeDollarSymbol);
          } else if (messageId == "Auth.form.error.role.notFound") {
            throw SignUpFailure(
                reason: RegisterFailureReason.defaultRoleNotFound);
          } else if (messageId == "Auth.form.error.email.format") {
            throw SignUpFailure(reason: RegisterFailureReason.invalidEmail);
          } else if (messageId == "Auth.form.error.email.taken") {
            throw SignUpFailure(
                reason: RegisterFailureReason.emailAlreadyTaken);
          } else {
            throw SignUpFailure(reason: RegisterFailureReason.unknown);
          }
        } else {
          throw SignUpFailure(reason: RegisterFailureReason.unknown);
        }
      }

      final Map<String, dynamic> data =
          response.data?['register'] as Map<String, dynamic>;

      // Keeping variable's immutability.
      final Map<String, dynamic> flattenResult =
          data['user'] as Map<String, dynamic>;
      flattenResult['token'] = data['jwt'];
      final Map<String, dynamic> result = flattenResult;

      return result;
    } on Exception catch (_) {
      throw SignUpFailure(reason: RegisterFailureReason.unknown);
    }
  }
}
