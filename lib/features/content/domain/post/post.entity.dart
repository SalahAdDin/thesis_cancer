import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/domain/comment/comment.entity.dart';
import 'package:thesis_cancer/features/content/domain/likes/likes.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

part 'post.entity.freezed.dart';
part 'post.entity.g.dart';

/// [Post] Model Entity
@freezed
class Post with _$Post {
  ///
  const factory Post({
    required String id,
    required PostType type,
    required String description,
    required List<UploadFile> gallery,
    User? author,
    String? title,
    DateTime? createdAt,
    List<Comment>? comments,
    List<Like>? likes,
    @Default(0) int likesCount,
  }) = _Post;

  const Post._();

  /// Builds a [Post] from a given json [String].
  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);

  /// Builds a empty(dummy) [Post].
  static const Post empty = Post(
    id: '',
    type: PostType.ACADEMY,
    description: '',
    // author: '',
    gallery: <UploadFile>[],
    likesCount: 0,
  );

  ///
  Profile get authorProfile => author?.profile ?? Profile.empty;
}
