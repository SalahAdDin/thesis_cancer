import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes.entity.freezed.dart';
part 'likes.entity.g.dart';

@freezed
class Like with _$Like {
  const factory Like(
      {required String id,
      required String postID,
      required String userID}) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
  static const empty = Like(id: '', postID: '', userID: '');
}
