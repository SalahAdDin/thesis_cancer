import 'package:thesis_cancer/features/content/domain/comment/comment.entity.dart';

abstract class CommentRepository {
  Future<List<Comment>> findAll();

  Future<List<Comment>> findByUserId(String id);

  Future<List<Comment>> findByPostId(String id);

  Future<Comment> findById(String id);

  Future<Comment> createComment(Comment comment);

  Future<void> removeComment(String commentId);

  Future<Comment> updateComment(Comment comment);
}
