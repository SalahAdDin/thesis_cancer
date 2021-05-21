import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.gql.dart';

class GraphQLSurveyRepository implements SurveyRepository {
  GraphQLSurveyRepository({required this.client}) : super();

  final GraphQLClient client;

  @override
  Future<List<Survey>> findAll() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListSurveys),
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> data = response.data?['surveys'];
      print(Colorize(data.toString()).yellow());
      final List<Survey> result =
          data.map((item) => Survey.fromJson(item)).toList();
      return result;
    } on Exception catch (error) {
      throw GraphQLFailure(error.toString());
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
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentGetSurvey),
        variables: {"id": id},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final Map<String, dynamic> data = response.data?['survey'];
      print(Colorize(data.toString()).yellow());
      return Survey.fromJson(data);
    } on Exception catch (error) {
      throw GraphQLFailure(error.toString());
    }
  }
}
