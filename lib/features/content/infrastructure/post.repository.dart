import 'package:enum_to_string/enum_to_string.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/errors/extension.entity.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.repository.dart';
import 'package:thesis_cancer/features/content/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/infrastructure/post.gql.dart';

/// **GraphQL** implementation for [PostRepository] interface
class GraphQLPostRepository implements PostRepository {
  /// Default constructor, it requires a [Provider] reference [Reader].
  GraphQLPostRepository({required this.reader}) : super();

  /// Provider reference [Reader].
  final Reader reader;

  /// Injecting the required [GraphQLClient] by reading it from providers.
  GraphQLClient get _client => reader(graphQLClientProvider);

  Extension _extractExtension(QueryResult response) {
    final GraphQLError graphQLError = response.exception!.graphqlErrors[0];
    final Extension extension = Extension.fromJson(
      graphQLError.extensions!,
    );
    return extension;
  }

  @override
  Future<void> createPost(Post post) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentCreatePost),
        variables: <String, dynamic>{"data": post},
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw PostFailure(reason: PostFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw PostFailure(reason: PostFailureReason.notFound);
        } else {
          throw PostFailure(reason: PostFailureReason.unknown);
        }
      }
      /*
      final Map<String, dynamic> data =
          response.data?['createPost']['post'] as Map<String, dynamic>;
      */
    } on Exception catch (_) {
      throw PostFailure(reason: PostFailureReason.unknown);
    }
  }

  @override
  Future<List<Post>> findAll() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListPosts),
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SettingsFailure(reason: SettingsFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SettingsFailure(reason: SettingsFailureReason.notFound);
        } else {
          throw SettingsFailure(reason: SettingsFailureReason.unknown);
        }
      }

      final List<dynamic> data = response.data?['posts'] as List<dynamic>;
      final List<Post> result = data
          .map((dynamic item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }

  @override
  Future<List<Post>> findByContentType(PostType contentType) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListPostsByContentType),
        variables: <String, dynamic>{
          "contentType": EnumToString.convertToString(contentType)
        },
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SettingsFailure(reason: SettingsFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SettingsFailure(reason: SettingsFailureReason.notFound);
        } else {
          throw SettingsFailure(reason: SettingsFailureReason.unknown);
        }
      }

      final List<dynamic> data = response.data?['posts'] as List<dynamic>;
      final List<Post> result = data
          .map((dynamic item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }

  @override
  Future<Post> findById(String id) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentGetPost),
        variables: <String, dynamic>{"id": id},
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SettingsFailure(reason: SettingsFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SettingsFailure(reason: SettingsFailureReason.notFound);
        } else {
          throw SettingsFailure(reason: SettingsFailureReason.unknown);
        }
      }

      final Map<String, dynamic> data =
          response.data?['post'] as Map<String, dynamic>;
      return Post.fromJson(data);
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }

  @override
  Future<List<Post>> findByUserId(String id) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListPostsByUserId),
        variables: <String, dynamic>{"id": id},
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SettingsFailure(reason: SettingsFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SettingsFailure(reason: SettingsFailureReason.notFound);
        } else {
          throw SettingsFailure(reason: SettingsFailureReason.unknown);
        }
      }

      final List<dynamic> data = response.data?['posts'] as List<dynamic>;
      final List<Post> result = data
          .map((dynamic item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }

  @override
  Future<void> removePost(String postId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentDeletePost),
        variables: <String, dynamic>{"id": postId},
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }

        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SettingsFailure(reason: SettingsFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SettingsFailure(reason: SettingsFailureReason.notFound);
        } else {
          throw SettingsFailure(reason: SettingsFailureReason.unknown);
        }
      }

      final Map<String, dynamic> data =
          response.data?['deletePost']['post'] as Map<String, dynamic>;
      final String id = data['id'] as String;
      if (postId != id) {
        throw PostFailure(reason: PostFailureReason.unexpectedResult);
      }
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }

  @override
  Future<Post> updatePost(Post post) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentUpdatePost),
        variables: <String, dynamic>{"id": post.id, "data": post},
      );
      final QueryResult response = await _client.query(options);

      if (response.hasException) {
        if (response.exception?.linkException is NetworkException) {
          throw GraphQLFailure(reason: FailureReason.unableToConnect);
        }
        final Extension extension = _extractExtension(response);
        final int errorCode = extension.statusCode!;
        if (errorCode == 403) {
          throw SettingsFailure(reason: SettingsFailureReason.unauthorized);
        } else if (errorCode == 404) {
          throw SettingsFailure(reason: SettingsFailureReason.notFound);
        } else {
          throw SettingsFailure(reason: SettingsFailureReason.unknown);
        }
      }

      final Map<String, dynamic> data =
          response.data?['updatePost']['post'] as Map<String, dynamic>;
      return Post.fromJson(data);
    } on Exception catch (_) {
      throw SettingsFailure(reason: SettingsFailureReason.unknown);
    }
  }
}
