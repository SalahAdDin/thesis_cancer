import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/errors/extension.entity.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/infrastructure/user.gql.dart';

/// **GraphQL** implementation for [UserRepository] interface
class GraphQLUserRepository implements UserRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLUserRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  GraphQLClient get _client => reader(graphQLClientProvider);

  ///
  Extension extractException(QueryResult<Map<String, dynamic>> response) {
    final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
    final Extension extension = Extension.fromJson(
      graphQLError.extensions!,
    );
    return extension;
  }

  @override
  Future<User> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<User> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<void> removeUser(String userId) {
    // TODO: implement removeUser
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>>? findUserWithQuery({
    required Map<String, dynamic> query,
  }) async {
    try {
      final QueryOptions<Map<String, dynamic>> options =
          QueryOptions<Map<String, dynamic>>(
        document: gql(graphQLDocumentFindUsers),
        variables: <String, dynamic>{
          "where": query,
        },
      );
      final QueryResult<Map<String, dynamic>> response =
          await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = extractException(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw UserFailure(reason: UserFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw UserFailure(reason: UserFailureReason.notFound);
        } else {
          throw UserFailure(reason: UserFailureReason.unknown);
        }
      }
      final List<dynamic> users = response.data?["users"] as List<dynamic>;
      return users
          .map((dynamic user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
    } on Exception catch (_) {
      throw GraphQLFailure(reason: FailureReason.unknown);
    }
  }
}
