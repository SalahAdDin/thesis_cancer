import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/infrastructure/profile.gql.dart';

class GraphQLProfileRepository implements ProfileRepository {
  GraphQLProfileRepository({required this.reader}) : super();

  final Reader reader;

  GraphQLClient get client => reader(graphQLClientProvider);

  @override
  Future<Profile> findById(String profileId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentGetProfile),
        variables: {"id": profileId},
      );
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw ProfileFailure();
      }
      final Map<String, dynamic> data =
          response.data?['profile'] as Map<String, dynamic>;
      return Profile.fromJson(data);
    } on Exception catch (error) {
      throw ProfileFailure();
    }
  }

  @override
  Future<Profile> findByUserId(String userId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentGetProfileByUserId),
        variables: {"userId": userId},
      );
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw ProfileFailure();
      }
      final Map<String, dynamic> data =
          response.data?['profiles'][0] as Map<String, dynamic>;
      return Profile.fromJson(data);
    } on OperationException catch (error) {
      final String message = error.graphqlErrors[0].message;
      /* TODO: the internal error/reason, could be "Unauthorized",
        we need to get a solution about plain and direct
        errors(from backend if we can).
        */
      if (message.contains("User Not Found")) {
        throw UserNotFoundFailure();
      } else if (message.contains("Forbidden")) {
        throw UnauthorizedRequest();
      } else {
        throw ProfileFailure();
      }
    } on Exception catch (error) {
      throw ProfileFailure();
    }
  }

  /* Updates the profile on server
  * return: The new updated profile to update now on the User state.
  * */
  @override
  Future<Profile> updateProfile({
    required String profileId,
    required Profile updatedProfile,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentUpdateProfile),
        variables: {"id": profileId, "data": updatedProfile},
      );
      final QueryResult response = await client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw ProfileFailure();
      }
      final Map<String, dynamic> data =
          response.data?['updateProfile']['profile'] as Map<String, dynamic>;
      return Profile.fromJson(data);
    } on Exception catch (error) {
      throw ProfileFailure();
    }
  }

  /* Upload the profile photo on server
  * return: The new uploaded profile photo to update now on the User state.
  * */
  @override
  Future<UploadFile> uploadProfilePhoto(UploadFile profilePhoto) {
    // TODO: implement uploadProfilePhoto
    throw UnimplementedError();
  }
}
