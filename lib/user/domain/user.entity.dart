import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/utils/types.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

@freezed
abstract class User with _$User {
  const factory User(
      {required String id,
      required String email,
      required String displayName,
      required UserRole role,
      bool? isConfirmed,
      bool? isLoggedIn,
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
  static const empty =
      User(id: '', email: '', displayName: '', role: UserRole.PILOT);
}
