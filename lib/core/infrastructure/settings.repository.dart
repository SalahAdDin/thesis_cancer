import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/errors/extension.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/infrastructure/settings.gql.dart';

/// **GraphQL** implementation for [SettingsRepository] interface
class GraphQLSettingsRepository implements SettingsRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLSettingsRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  /// Injecting the required [GraphQLClient] by reading it from providers.
  GraphQLClient get client => reader(graphQLClientProvider);

  @override
  Future<Map<String, dynamic>> fetchSettings() async {
    try {
      final QueryOptions options =
          QueryOptions(document: gql(graphQLDocumentGetSettings));
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
      }

      // It will return null or application always
      if (response.data?['application'] == null) {
        throw SettingsFailure(reason: SettingsFailureReason.notFound);
      }

      final Map<String, dynamic> data =
          response.data?['application'] as Map<String, dynamic>;

      // Keeping variable's immutability.
      final Map<String, dynamic> flattenResult = data;
      final List<dynamic> rawSurveySchedules =
          data['surveySchedules'] as List<dynamic>;
      final List<Map<String, dynamic>> flattenSurveySchedules =
          rawSurveySchedules.map((dynamic data) {
        final Map<String, dynamic> flattenSurvey = data as Map<String, dynamic>;
        flattenSurvey['survey'] = data['survey']['id'];
        return flattenSurvey;
      }).toList();
      flattenResult['surveySchedules'] = flattenSurveySchedules;
      flattenResult['registeringSurvey'] = data['registeringSurvey']['id'];
      final Map<String, dynamic> result = flattenResult;

      return result;
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }
}
