import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/user.gql.dart';

/*
* Cognito's user model has email as is username, what is always unique; hence,
* we can match API user's model with Cognito's user model by the email field.
* */

class AmplifyGraphQLUserRepository implements UserRepository {
  AmplifyGraphQLUserRepository({APICategory? apiCategory})
      : _apiCategory = apiCategory ?? Amplify.API;

  final APICategory _apiCategory;

  @override
  Future<List<User>> findAll() async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest<String>(document: graphQLDocumentListUsers));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed =
          jsonDecode(data['listUsers']['items']).cast<Map<String, dynamic>>();
      List<User> result =
          parsed.map<User>((json) => User.fromJson(json)).toList();
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<User> findById(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest<String>(
              document: graphQLDocumentGetUser, variables: {'id': id}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['getUser'];
      /* TODO: parse data
      * Posts.fromJson (just for showing)
      * SurveyResult // MUST BE
      * */
      print("Data: $data");
      return User.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<User> createUser(User user) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentCreateUser,
              variables: {
            'id': user.id,
            'email': user.email,
            'displayName': user.displayName,
            'role': user.role
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['createUser'];
      // TODO: parse data
      print("Data: $data");
      return User.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<void> removeUser(String userId) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentDeleteUser,
              variables: {
            'id': userId,
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['deleteUser'];
      // TODO: parse data
      // TODO: verify result.id vs userId
      print("Data: $result");
      if (userId == result['id'])
        return;
      else
        throw ApiException(
            'Error at deleting User with id $userId on Backend.');
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<User> updateUser(User user) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentUpdateUser,
              variables: {
            'id': user.id,
            'email': user.email,
            'displayName': user.displayName,
            'role': user.role,
            'phoneNumber': user.phoneNumber,
            'isConfirmed': user.isConfirmed,
            'hasSeenTutorial': user.hasSeenTutorial,
            'hasSeenIntroductoryVideo': user.hasSeenIntroductoryVideo,
            'darkMode': user.darkMode,
            'bio': user.bio,
            'photoID': user.photoID
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['updateUser'];
      // TODO: parse data
      print("Data: $data");
      return User.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }
}
