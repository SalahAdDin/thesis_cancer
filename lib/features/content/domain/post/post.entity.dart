import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/domain/comment/comment.entity.dart';
import 'package:thesis_cancer/features/content/domain/likes/likes.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

part 'post.entity.freezed.dart';
part 'post.entity.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required ContentType type,
    required String content,
    required String userID,
    required List<UploadFile> media,
    List<Comment>? comments,
    List<Like>? likes,
    @Default(0) int likesCount,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  static const empty = Post(
    id: '',
    type: ContentType.ACADEMY,
    content: '',
    userID: '',
    media: [],
    likesCount: 0,
  );
}
