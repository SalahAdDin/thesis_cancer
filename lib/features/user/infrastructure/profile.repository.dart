import 'package:colorize/colorize.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/infrastructure/profile.gql.dart';

/// **GraphQL** implementation for [ProfileRepository] interface
class GraphQLProfileRepository implements ProfileRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLProfileRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  /// Injecting the required [GraphQLClient] by reading it from providers.
  GraphQLClient get _client => reader(graphQLClientProvider);

  @override
  Future<Profile> findById(String profileId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentGetProfile),
        variables: <String, dynamic>{"id": profileId},
      );
      final QueryResult response = await _client.query(options);

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
        variables: <String, dynamic>{"userId": userId},
      );
      final QueryResult response = await _client.query(options);

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

  /// Updates the profile on server
  /// Returns the new updated [Profile] to update now on the [UserState].
  @override
  Future<Profile> updateProfile({
    required Profile updatedProfile,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentUpdateProfile),
        variables: <String, dynamic>{
          "id": updatedProfile.id,
          // Uploading files with GraphQL requires a different process,
          // so we will handle it in a separate query.
          "data": updatedProfile.copyWith(
            profilePhoto: null,
            id: null,
          ),
        },
      );
      final QueryResult response = await _client.query(options);

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

  /// Upload the profile photo on server
  /// Returns the new uploaded [Profile] photo to update now on the [UserState].
  @override
  Future<Profile> updateProfilePhoto({
    required String profileId,
    required String photoId,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentUpdateProfile),
        variables: <String, dynamic>{
          "id": profileId,
          // Uploading files with GraphQL requires a different process,
          // so we will handle it in a separate query.
          "data": <String, dynamic>{
            "profilePhoto": photoId,
          },
        },
      );
      final QueryResult response = await _client.query(options);

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

  @override
  Future<int> countPotsByUser({required String userId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentCountPosts),
        variables: <String, dynamic>{"userID": userId},
      );
      final QueryResult response = await _client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final int count = response.data?['postsCount'] as int;
      return count;
    } on Exception catch (error) {
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<List<Profile>>? findProfilesWithQuery({
    required Map<String, dynamic> query,
  }) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentFindProfiles),
        variables: <String, dynamic>{
          "where": query,
        },
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> profiles =
          response.data?["profiles"] as List<dynamic>;
      return profiles
          .map((dynamic profile) =>
              Profile.fromJson(profile as Map<String, dynamic>))
          .toList();
    } on Exception catch (error) {
      throw ProfileFailure();
    }
  }
}
