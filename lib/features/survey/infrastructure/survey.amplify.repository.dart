import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.gql.dart';

class AmplifyGraphQLSurveyRepository implements SurveyRepository {
  AmplifyGraphQLSurveyRepository({APICategory? apiCategory})
      : _apiCategory = apiCategory ?? Amplify.API;

  final APICategory _apiCategory;

  @override
  Future<Survey> createSurvey(Survey survey) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentCreateSurvey,
              variables: {
            'id': survey.id,
            'intro': survey.intro,
            'title': survey.title
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['createSurvey'];
      // TODO: parse data
      print("Data: $data");
      return Survey.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<Survey>> findAll() async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request:
              GraphQLRequest<String>(document: graphQLDocumentListSurveys));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed =
          jsonDecode(data['listSurveys']['items']).cast<Map<String, dynamic>>();
      List<Survey> result = parsed.map<Survey>((json) => Survey.fromJson(json));
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  /*
  * Builds a new survey from the GraphQL response.
  *
  * As the response comes with an additional level(by the 'items' key),
  * it is needed to flatten it to a new variable (to keep the result immutability).
  * */
  @override
  Future<Survey> findById(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest<String>(
              document: graphQLDocumentGetSurvey, variables: {'id': id}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['getSurvey'];
      Map<String, dynamic> flattenResult = result;
      flattenResult['questions'] = result['questions']['items'];
      return Survey.fromJson(flattenResult);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<void> removeSurvey(String surveyId) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentDeleteSurvey,
              variables: {
            'id': surveyId,
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['deleteSurvey'];
      // TODO: parse data
      // TODO: verify result.id vs userId
      print("Data: $result");
      if (surveyId == result['id'])
        return;
      else
        throw ApiException(
            'Error at deleting Survey with id $surveyId on Backend.');
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<Survey> updateSurvey(Survey survey) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentUpdateSurvey,
              variables: {
            'id': survey.id,
            'intro': survey.intro,
            'title': survey.title
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['updateSurvey'];
      // TODO: parse data
      print("Data: $data");
      return Survey.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }
}
