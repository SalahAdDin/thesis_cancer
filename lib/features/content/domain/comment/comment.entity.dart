import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.entity.freezed.dart';
part 'comment.entity.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String postID,
    required String userID,
    required String content,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  static const empty =
      Comment(id: '', postID: '', userID: '', content: 'Dummy comment');
}
