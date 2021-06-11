import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.gql.dart';

class GraphQLResultRepository implements UserSurveyResultRepository {
  GraphQLResultRepository({required this.reader}) : super();

  final Reader reader;

  GraphQLClient get client => reader(graphQLClientProvider);

  @override
  Future<int> countUserSurveyResults({
    required String userId,
    required String surveyId,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentCountResults),
        variables: <String, dynamic>{"surveyID": surveyId, "userID": userId},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final int count = response.data?['resultsCount'] as int;
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
        variables: <String, dynamic>{"data": userSurveyResult},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      /*
      final Map<String, dynamic> data =
          response.data?['createResult']['result'] as Map<String, dynamic>;
      */
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }
}
