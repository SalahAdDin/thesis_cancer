import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/question.gql.dart';

class AmplifyGraphQLResultQuestionRepository implements QuestionRepository {
  AmplifyGraphQLResultQuestionRepository({APICategory? apiCategory})
      : _apiCategory = apiCategory ?? Amplify.API;

  final APICategory _apiCategory;

  @override
  Future<Question> createQuestion(Question question) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentCreateQuestion,
              variables: {
            'id': question.id,
            'answer': question.answer,
            'statement': question.statement,
            'type': question.type,
            'surveyID': question.surveyID
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['createQuestion'];
      // TODO: parse data
      print("Data: $data");
      return Question.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<Question>> findAll() async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request:
              GraphQLRequest<String>(document: graphQLDocumentListQuestions));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed = jsonDecode(data['listQuestions']['items'])
          .cast<Map<String, dynamic>>();
      List<Question> result =
          parsed.map<Question>((json) => Question.fromJson(json));
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<Question> findById(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest<String>(
              document: graphQLDocumentGetQuestion, variables: {'id': id}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['getQuestion'];
      print("Data: $data");
      return Question.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<List<Question>> findBySurveyId(String id) async {
    try {
      GraphQLOperation operation = _apiCategory.query(
          request: GraphQLRequest(
              document: graphQLDocumentListFilteredQuestions,
              variables: {'filter': graphQLFilterQuestionBySurvey(id)}));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final parsed = jsonDecode(data['listQuestions']['items'])
          .cast<Map<String, dynamic>>();
      List<Question> result =
          parsed.map<Question>((json) => Question.fromJson(json)).toList();
      return result;
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<void> removeQuestion(String questionId) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentDeleteQuestion,
              variables: {
            'id': questionId,
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['deleteQuestion'];
      // TODO: parse data
      // TODO: verify result.id vs userId
      print("Data: $result");
      if (questionId == result['id'])
        return;
      else
        throw ApiException(
            'Error at deleting Question with id $questionId on Backend.');
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }

  @override
  Future<Question> updateQuestion(Question question) async {
    try {
      GraphQLOperation operation = _apiCategory.mutate(
          request: GraphQLRequest<String>(
              document: graphQLDocumentUpdateQuestion,
              variables: {
            'id': question.id,
            'answer': question.answer,
            'statement': question.statement,
            'type': question.type,
            'surveyID': question.surveyID
          }));
      GraphQLResponse response = await operation.response;
      final Map<String, dynamic> data = json.decode(response.data);
      final Map<String, dynamic> result = data['updateQuestion'];
      // TODO: parse data
      print("Data: $data");
      return Question.fromJson(result);
    } on ApiException catch (error) {
      throw ApiException(error.message);
    }
  }
}
