import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/errors/extension.entity.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.gql.dart';

/// **GraphQL** implementation for [UserSurveyResultRepository] interface
class GraphQLResultRepository implements UserSurveyResultRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLResultRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  /// Injecting the required [GraphQLClient] by reading it from providers.
  GraphQLClient get client => reader(graphQLClientProvider);

  ///
  Extension extractException(QueryResult<Map<String, dynamic>> response) {
    final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
    final Extension extension = Extension.fromJson(
      graphQLError.extensions!,
    );
    return extension;
  }

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
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = extractException(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw ResultFailure(reason: ResultFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw ResultFailure(reason: ResultFailureReason.notFound);
        } else {
          throw ResultFailure(reason: ResultFailureReason.unknown);
        }
      }
      final int count = response.data?['resultsCount'] as int;
      return count;
    } on Exception catch (_) {
      throw ResultFailure(reason: ResultFailureReason.unknown);
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
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }

        final Extension extension = extractException(response);

        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw ResultFailure(reason: ResultFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw ResultFailure(reason: ResultFailureReason.notFound);
        } else {
          throw ResultFailure(reason: ResultFailureReason.unknown);
        }
      }
      /*
      final Map<String, dynamic> data =
          response.data?['createResult']['result'] as Map<String, dynamic>;
      */
    } on Exception catch (_) {
      throw ResultFailure(reason: ResultFailureReason.unknown);
    }
  }
}
