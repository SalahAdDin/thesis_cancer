import 'package:colorize/colorize.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.repository.dart';
import 'package:thesis_cancer/features/content/infrastructure/post.gql.dart';

class GraphQLPostRepository implements PostRepository {
  GraphQLPostRepository({required this.reader}) : super();

  final Reader reader;

  GraphQLClient get client => reader(graphQLAuthClientProvider);

  @override
  Future<void> createPost(Post post) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentCreatePost),
        variables: {"data": post},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      /*
      final Map<String, dynamic> data =
          response.data?['createPost']['post'] as Map<String, dynamic>;
      */
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<List<Post>> findAll() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListPosts),
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> data = response.data?['posts'] as List<dynamic>;
      final List<Post> result = data
          .map((item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<List<Post>> findByContentType(ContentType contentType) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListPostsByContentType),
        variables: {"contentType": EnumToString.convertToString(contentType)},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> data = response.data?['posts'] as List<dynamic>;
      final List<Post> result = data
          .map((item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<Post> findById(String id) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentGetPost),
        variables: {"id": id},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final Map<String, dynamic> data =
          response.data?['post'] as Map<String, dynamic>;
      return Post.fromJson(data);
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<List<Post>> findByUserId(String id) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentListPostsByUserId),
        variables: {"id": id},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final List<dynamic> data = response.data?['posts'] as List<dynamic>;
      final List<Post> result = data
          .map((item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<void> removePost(String postId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentDeletePost),
        variables: {"id": postId},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final Map<String, dynamic> data =
          response.data?['deletePost']['post'] as Map<String, dynamic>;
      final String id = data['id'] as String;
      if (postId != id) {
        throw GraphQLFailure(response.exception.toString());
      }
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }

  @override
  Future<Post> updatePost(Post post) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(graphQLDocumentUpdatePost),
        variables: {"id": post.id, "data": post},
      );
      final QueryResult response = await client.query(options);
      if (response.hasException) {
        print(Colorize(response.exception.toString()).red());
        throw GraphQLFailure(response.exception.toString());
      }
      final Map<String, dynamic> data =
          response.data?['updatePost']['post'] as Map<String, dynamic>;
      return Post.fromJson(data);
    } on Exception catch (error) {
      print(Colorize(error.toString()).red());
      throw GraphQLFailure(error.toString());
    }
  }
}
