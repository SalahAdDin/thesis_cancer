import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/errors/extension.entity.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.gql.dart';

/// **GraphQL** implementation for [SurveyRepository] interface
class GraphQLSurveyRepository implements SurveyRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLSurveyRepository({required this.reader}) : super();

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
  Future<List<Survey>> findAll() async {
    try {
      final QueryOptions<Map<String, dynamic>> options =
          QueryOptions<Map<String, dynamic>>(
        document: gql(graphQLDocumentListSurveys),
      );
      final QueryResult<Map<String, dynamic>> response =
          await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = extractException(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SurveyFailure(reason: SurveyFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SurveyFailure(reason: SurveyFailureReason.notFound);
        } else {
          throw SurveyFailure(reason: SurveyFailureReason.unknown);
        }
      }

      final List<dynamic> data = response.data?['surveys'] as List<dynamic>;
      final List<Survey> result = data
          .map((dynamic item) => Survey.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (_) {
      throw SurveyFailure(reason: SurveyFailureReason.unknown);
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
      final QueryOptions<Map<String, dynamic>> options =
          QueryOptions<Map<String, dynamic>>(
        document: gql(graphQLDocumentGetSurvey),
        variables: <String, dynamic>{"id": id},
      );
      final QueryResult<Map<String, dynamic>> response =
          await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = extractException(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SurveyFailure(reason: SurveyFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SurveyFailure(reason: SurveyFailureReason.notFound);
        } else {
          throw SurveyFailure(reason: SurveyFailureReason.unknown);
        }
      }

      if (response.data?['survey'] == null) {
        // throw SurveyNotFound("The poll with ID $id was not found.");
        throw SurveyFailure(reason: SurveyFailureReason.notFound);
      }

      final Map<String, dynamic> data =
          response.data?['survey'] as Map<String, dynamic>;
      return Survey.fromJson(data);
    } on Exception catch (_) {
      throw SurveyFailure(reason: SurveyFailureReason.unknown);
    }
  }
}
