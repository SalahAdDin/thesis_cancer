import 'package:thesis_cancer/content/domain/likes.entity.dart';

abstract class LikesRepository {
  Future<List<Likes>> findAll();
  Future<List<Likes>> findByUserId(String id);
  Future<List<Likes>> findByPostId(String id);
  Future<Likes> findById(String id);
  Future<Likes> findByUserAndPostId(String userId, String postId);
  Future<Likes> createLike(Likes like);
  Future<void> removeLike(Likes like);
}
