import 'package:graphql/client.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/auth.gql.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';

class GraphQLAuthRepository implements AuthRepository {
  GraphQLAuthRepository({required this.client}) : super();

  final GraphQLClient client;

  @override
  Future<bool> forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future resetPassword(
      {required String password,
      required String passwordConfirmation,
      required String confirmationCode}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future signIn(
      {required String identifier,
      required String password,
      String? provider}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentRegisterUser),
        variables: {'username': username, 'email': email, 'password': password},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        throw SignUpFailure(response.exception.toString());
      }
      final Map<String, dynamic> result = response.data?['register'];
      return result;
    } on Exception catch (error) {
      throw SignUpFailure(error.toString());
    }
  }
}
