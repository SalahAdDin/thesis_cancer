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
        /*final message = response.exception!.graphqlErrors[0].message;
        if (message.contains("User Not Found") ||
            message.contains("Invalid token")) {
          await _storage.delete(key: "jwt");
          Get.offAllNamed(SignInScreen.routeName);
          return;
        }*/
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> data = response.data?['surveys'] as List<dynamic>;
      print(Colorize(data.toString()).yellow());
      final List<Survey> result = data
          .map((item) => Survey.fromJson(item as Map<String, dynamic>))
          .toList();
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
      final Map<String, dynamic> data =
          response.data?['survey'] as Map<String, dynamic>;
      return Survey.fromJson(data);
    } on Exception catch (error) {
      throw GraphQLFailure(error.toString());
    }
  }
}
