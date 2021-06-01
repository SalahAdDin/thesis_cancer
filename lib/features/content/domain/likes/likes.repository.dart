import 'package:thesis_cancer/features/content/domain/likes/likes.entity.dart';

abstract class LikesRepository {
  Future<List<Like>> findAll();

  Future<List<Like>> findByUserId(String id);

  Future<List<Like>> findByPostId(String id);

  Future<Like> findById(String id);

  Future<Like> findByUserAndPostId(String userId, String postId);

  Future<Like> createLike(Like like);

  Future<void> removeLike(String likeId);
}
