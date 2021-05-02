import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/answer.gql.dart';

class AmplifyGraphQLAnswerRepository implements UserSurveyAnswerRepository {
  AmplifyGraphQLAnswerRepository({APICategory? apiCategory})
      : _apiCategory = apiCategory ?? Amplify.API;
  final APICategory _apiCategory;

  @override
  Future<UserSurveyAnswer> createUserAnswer(
      UserSurveyAnswer userSurveyAnswer) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentCreateUserSurveyAnswer,
              variables: {
            'answer': userSurveyAnswer.answer,
            'id': userSurveyAnswer.id,
            'questionID': userSurveyAnswer.questionId,
            'userSurveyResultID': userSurveyAnswer.userSurveyResultId
          }));
      GraphQLResponse response = await operation.response;
      // TODO: Check the data and return the status code, or check both objects to be equal
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['createUserSurveyAnswer'];
      if (userSurveyAnswer == UserSurveyAnswer.fromJson(result))
        return userSurveyAnswer;
      else
        throw ApiException(
            'Error at creating User Survey Answer { $userSurveyAnswer } on Backend.');
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<void> removeUserAnswer(String userSurveyAnswerId) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentDeleteSurveyAnswer,
              variables: {'id': userSurveyAnswerId}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['deleteUserSurveyAnswer'];
      // TODO: parse data
      // TODO: verify result.id vs userId
      print("Data: $result");
      if (userSurveyAnswerId == result['id'])
        return;
      else
        throw ApiException(
            'Error at deleting User Survey Answer with id $userSurveyAnswerId on Backend.');
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }
}
