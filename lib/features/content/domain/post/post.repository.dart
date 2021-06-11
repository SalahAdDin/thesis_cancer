import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';

abstract class PostRepository {
  Future<List<Post>> findAll();

  Future<List<Post>> findByContentType(PostType contentType);

  Future<List<Post>> findByUserId(String id);

  Future<Post> findById(String id);

  Future<void> createPost(Post post);

  Future<void> removePost(String postId);

  Future<Post> updatePost(Post post);
}
