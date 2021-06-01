import 'package:thesis_cancer/features/user/domain/user.entity.dart';

abstract class UserRepository {
  Future<List<User>> findAll();

  Future<User> findById(String id);

  Future<User> createUser(User user);

  Future<void> removeUser(String userId);

  Future<User> updateUser(User user);
}
