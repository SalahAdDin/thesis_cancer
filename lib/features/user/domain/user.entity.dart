import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/domain/comment/comment.entity.dart';
import 'package:thesis_cancer/features/content/domain/likes/likes.entity.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

// TODO: First name, last name?
@freezed
class User with _$User {
  const factory User(
      {required String id,
      required String email,
      required String displayName,
      required UserRole role,
      String? phoneNumber,
      bool? confirmed,
      bool? isLoggedIn,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      bool? darkMode,
      String? bio,
      UploadFile? profilePhoto, // TODO: how to properly handle this?
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  static const empty =
      User(id: '', email: '', displayName: '', role: UserRole.GUEST);
}
