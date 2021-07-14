import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
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
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentFindUsers),
        variables: <String, dynamic>{
          "where": query,
        },
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> users = response.data?["users"] as List<dynamic>;
      return users
          .map((dynamic user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
    } on Exception catch (error) {
      throw UserFailure();
    }
  }
}
