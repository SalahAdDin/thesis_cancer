import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.gql.dart';

class GraphQLResultRepository implements UserSurveyResultRepository {
  GraphQLResultRepository({required this.client}) : super();

  final GraphQLClient client;

  @override
  Future<int> countUserSurveyResults(String userId, String surveyId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentCountResults),
        variables: {"surveyID": surveyId, "userID": userId},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final int count = response.data?['resultsCount'];
      print(Colorize(count.toString()).yellow());
      return count;
    } on Exception catch (error) {
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<void> createUserSurveyResult(UserSurveyResult userSurveyResult) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentCreateResult),
        variables: {
          "iteration": userSurveyResult.iteration,
          "answers": userSurveyResult.answers,
          "user": userSurveyResult.user,
          "survey": userSurveyResult.survey
        },
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      // TODO: remove this after check
      final Map<String, dynamic> data = response.data?['result'];
      print(Colorize(data.toString()).yellow());
    } on Exception catch (error) {
      throw GraphQLFailure(error.toString());
    }
  }
}
