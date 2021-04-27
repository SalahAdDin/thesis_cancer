abstract class AdminRepository {
  Future<void> addUserToGroup(
      {required String username, required String groupName});

  Future<void> confirmUserSignUp({required String username});

  Future<void> disableUser({required String username});

  Future<List<Map<String, dynamic>>> listUsers({int? limit});
}
