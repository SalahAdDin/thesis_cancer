import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';

class GraphQLUserRepository implements UserRepository {
  GraphQLUserRepository({required this.reader}) : super();

  final Reader reader;

  GraphQLClient get client => reader(graphQLClientProvider);

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
}
