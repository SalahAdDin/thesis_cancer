import 'dart:typed_data';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/features/user/domain/admin.repository.dart';

// https://docs.amplify.aws/cli/auth/admin
// https://docs.amplify.aws/lib/restapi/update/q/platform/flutter

class AmplifyAdminQueriesRepository implements AdminRepository {
  AmplifyAdminQueriesRepository({APICategory? apiCategory})
      : _apiCategory = apiCategory ?? Amplify.API;

  final APICategory _apiCategory;
  final String _apiName = 'AdminQueries';

  @override
  Future<void> addUserToGroup(
      {required String username, required String groupName}) async {
    try {
      RestOptions restOptions = RestOptions(
          path: "/addUserToGroup",
          apiName: _apiName,
          body: Uint8List.fromList(
              '{\'username\': $username, \'groupname\': $groupName}'
                  .codeUnits));
      RestOperation restOperation = _apiCategory.post(restOptions: restOptions);
      RestResponse restResponse = await restOperation.response;
      print(new String.fromCharCodes(restResponse.data));
    } on ApiException catch (error) {}
  }

  @override
  Future<void> confirmUserSignUp({required String username}) async {
    try {
      RestOptions restOptions = RestOptions(
          path: "/confirmUserSignUp",
          apiName: _apiName,
          body: Uint8List.fromList('{\'username\': $username'.codeUnits));
      RestOperation restOperation = _apiCategory.post(restOptions: restOptions);
      RestResponse restResponse = await restOperation.response;
      print(new String.fromCharCodes(restResponse.data));
    } on ApiException catch (error) {}
  }

  @override
  Future<void> disableUser({required String username}) async {
    try {
      RestOptions restOptions = RestOptions(
          path: "/disableUser",
          apiName: _apiName,
          body: Uint8List.fromList('{\'username\': $username'.codeUnits));
      RestOperation restOperation = _apiCategory.post(restOptions: restOptions);
      RestResponse restResponse = await restOperation.response;
      print(new String.fromCharCodes(restResponse.data));
    } on ApiException catch (error) {}
  }

  @override
  Future<List<Map<String, dynamic>>> listUsers({int? limit}) async {
    try {
      RestOptions restOptions = RestOptions(
          path: '/listUsers',
          apiName: _apiName,
          queryParameters: {'limit': limit.toString()});
      RestOperation restOperation = _apiCategory.get(restOptions: restOptions);
      RestResponse restResponse = await restOperation.response;
      // TODO: parse the response
      print("Getting users from Cognito: $restResponse");
      List<Map<String, dynamic>> users = [{}];

      return users;
    } on ApiException catch (error) {
      // TODO: every exception should be retrieved like this
      throw ApiException(error.message);
    }
  }
}
