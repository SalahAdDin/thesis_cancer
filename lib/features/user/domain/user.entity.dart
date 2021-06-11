import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/content/domain/comment/comment.entity.dart';
import 'package:thesis_cancer/features/content/domain/likes/likes.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

// TODO: First name, last name?
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String username,
    Profile? profile,
    String? token,
    bool? confirmed,
    bool? isLoggedIn,
    List<UserSurveyResult>? surveyResults,
    List<Post>? posts,
    List<Comment>? comments,
    List<Like>? likes,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  static const User empty = User(
    id: '',
    email: 'name@dummy.com',
    username: 'DummyName',
    profile: Profile.empty,
  );
}
