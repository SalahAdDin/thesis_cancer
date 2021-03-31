import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/utils/types.dart';

part 'user.entity.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User(
      {required String id,
      required String email,
      required String displayName,
      required UserRole role,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      bool? darkMode,
      String? bio,
      String? photoID,
      Map? gallery,
      Map? posts,
      Map? comments,
      Map? likes}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
