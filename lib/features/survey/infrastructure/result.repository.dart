import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.gql.dart';

class AmplifyGraphQLResultRepository implements UserSurveyResultRepository {
  AmplifyGraphQLResultRepository({APICategory? apiCategory})
      : _apiCategory = apiCategory ?? Amplify.API;

  final APICategory _apiCategory;

  @override
  Future<UserSurveyResult> createUserSurveyResult(
      UserSurveyResult userSurveyResult) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentCreateUserSurveyResult,
              variables: {
            'id': userSurveyResult.id,
            'userID': userSurveyResult.userID,
            'surveyID': userSurveyResult.surveyID,
            'iteration': userSurveyResult.iteration
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['createUserSurveyResult'];
      // TODO: parse data
      print("Data: $data");
      return UserSurveyResult.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<UserSurveyResult>> findAll() async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest<String>(
              document: graphQLDocumentListUserSurveyResults));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed = jsonDecode(data['listUserSurveyResults']['items'])
          .cast<Map<String, dynamic>>();
      List<UserSurveyResult> result = parsed
          .map<UserSurveyResult>((json) => UserSurveyResult.fromJson(json));
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<UserSurveyResult> findById(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest<String>(
              document: graphQLDocumentGetUserSurveyResult,
              variables: {'id': id}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      // TODO: Pop ['answers']['items']
      //  from this and return to make Answers.fromJson available
      final Map<String, dynamic> result = data['getUserSurveyResult'];
      /* TODO: parse data
      * Posts.fromJson (just for showing)
      * SurveyResult // MUST BE
      * */
      print("Data: $data");
      return UserSurveyResult.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<UserSurveyResult>> findBySurveyAndUserId(
      String surveyId, String userId) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest(
              document: graphQLDocumentListFilteredResults,
              variables: {
            'filter': graphQLFilterResultBySurveyAndUser(surveyId, userId)
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed = jsonDecode(data['listUserSurveyResults']['items'])
          .cast<Map<String, dynamic>>();
      List<UserSurveyResult> result = parsed
          .map<UserSurveyResult>((json) => UserSurveyResult.fromJson(json))
          .toList();
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<UserSurveyResult>> findBySurveyId(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest(
              document: graphQLDocumentListFilteredResults,
              variables: {'filter': graphQLFilterResultBySurvey(id)}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed = jsonDecode(data['listUserSurveyResults']['items'])
          .cast<Map<String, dynamic>>();
      List<UserSurveyResult> result = parsed
          .map<UserSurveyResult>((json) => UserSurveyResult.fromJson(json))
          .toList();
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<UserSurveyResult>> findByUserId(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest(
              document: graphQLDocumentListFilteredResults,
              variables: {'filter': graphQLFilterResultByUser(id)}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed = jsonDecode(data['listUserSurveyResults']['items'])
          .cast<Map<String, dynamic>>();
      List<UserSurveyResult> result = parsed
          .map<UserSurveyResult>((json) => UserSurveyResult.fromJson(json))
          .toList();
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<void> removeUserSurveyResult(String userSurveyResultId) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentDeleteUserSurveyResult,
              variables: {
            'id': userSurveyResultId,
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['deleteUserSurveyResult'];
      // TODO: parse data
      // TODO: verify result.id vs userId
      print("Data: $result");
      if (userSurveyResultId == result['id'])
        return;
      else
        throw ApiException(
            'Error at deleting User Survey Result with id $userSurveyResultId on Backend.');
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }
}
