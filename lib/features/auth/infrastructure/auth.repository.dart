import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/auth.gql.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';

class GraphQLAuthRepository implements AuthRepository {
  GraphQLAuthRepository({required this.reader}) : super();

  final Reader reader;

  GraphQLClient get client => reader(graphQLClientProvider);

  Map<String, dynamic> flatAuthResponse({required Map<String, dynamic> data}) {
    final Map<String, dynamic> flattenResult =
        data['user'] as Map<String, dynamic>;
    flattenResult['token'] = data['jwt'];
    final Map<String, dynamic> result = flattenResult;

    return result;
  }

  @override
  Future<bool> forgotPassword({required String email}) async {
    try {
      final QueryOptions options = QueryOptions(
          document: gql(graphQLDocumentForgotPassword),
          variables: {
            "email": email,
          });
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw ForgotPasswordFailure(response.exception.toString());
      }
      final bool result = response.data?['forgotPassword']['ok'] as bool;

      return result;
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw ForgotPasswordFailure(error.toString());
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
        variables: {
          "password": password,
          "passwordConfirmation": passwordConfirmation,
          "code": confirmationCode
        },
      );
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw ResetPasswordFailure(response.exception.toString());
      }
      final Map<String, dynamic> data =
          response.data?['resetPassword'] as Map<String, dynamic>;

      return flatAuthResponse(data: data);
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw ResetPasswordFailure(error.toString());
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
          variables: {
            "identifier": identifier,
            "password": password,
            "provider": provider
          });
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          // handle network issues, maybe
          // TODO: Following code does not work here.
          /*} else {
          final String message = response.exception!.graphqlErrors[0].message;
          */ /*response.exception?.graphqlErrors[0].extensions?['exception']
                  ['data']['message'][0]["messages"][0]['id'] as String;*/ /*

          print(Colorize("Error from if:  $message").red());
          if (message.contains("Bad Request")) {
            throw LogInFailureByBadRequest();
          }*/
          throw LogInFailure();
        } else {
          final String message = response.exception!.graphqlErrors[0].message;
          if (message.contains("Bad Request")) {
            throw LogInFailureByBadRequest();
          } else {
            throw LogInFailure();
          }
        }
      }
      final Map<String, dynamic> data =
          response.data?['login'] as Map<String, dynamic>;

      return flatAuthResponse(data: data);
    } on OperationException catch (error) {
      final String message = error.graphqlErrors[0].message;
      if (message.contains("Bad Request")) {
        throw LogInFailureByBadRequest();
      } else {
        throw LogInFailure();
      }
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
        variables: {'username': username, 'email': email, 'password': password},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        throw SignUpFailure(response.exception.toString());
      }
      final Map<String, dynamic> data =
          response.data?['register'] as Map<String, dynamic>;

      // Keeping variable's immutability.
      final Map<String, dynamic> flattenResult =
          data['user'] as Map<String, dynamic>;
      flattenResult['token'] = data['jwt'];
      final Map<String, dynamic> result = flattenResult;

      return result;
    } on Exception catch (error) {
      throw SignUpFailure(error.toString());
    }
  }
}
