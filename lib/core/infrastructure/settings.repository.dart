import 'package:graphql/client.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/infrastructure/settings.gql.dart';

class GraphQLSettingsRepository implements SettingsRepository {
  GraphQLSettingsRepository({required this.client}) : super();

  final GraphQLClient client;

  @override
  Future<Map<String, dynamic>> fetchSettings() async {
    try {
      final QueryOptions options =
          QueryOptions(document: gql(graphQLDocumentGetSettings));
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print("GetSettings Failure: ${response.exception}");
        throw GetSettingsFailure(response.exception.toString());
      }
      final Map<String, dynamic> data = response.data?['application'];

      // Keeping variable's immutability.
      Map<String, dynamic> flattenResult = data;
      List<dynamic> rawSurveySchedules = data['surveySchedules'];
      List<Map<String, dynamic>> flattenSurveySchedules =
          rawSurveySchedules.map((data) {
        Map<String, dynamic> flattenSurvey = data;
        flattenSurvey['survey'] = data['survey']['id'];
        return flattenSurvey;
      }).toList();
      flattenResult['surveySchedules'] = flattenSurveySchedules;
      flattenResult['registeringSurvey'] = data['registeringSurvey']['id'];
      final Map<String, dynamic> result = flattenResult;

      return result;
    } on Exception catch (error) {
      throw GetSettingsFailure(error.toString());
    }
  }
}
