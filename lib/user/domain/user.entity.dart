import 'package:thesis_cancer/utils/types.dart';

class User {
  final String id;
  final String email;
  final String displayName;
  final UserRole role;
  final bool? hasSeenTutorial;
  final bool? hasSeenIntroductoryVideo;
  final String? bio;
  final String? photoID;
  final Map? gallery;
  final Map? posts;
  final Map? comments;
  final Map? likes;

  const User(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.role,
      this.hasSeenTutorial = false,
      this.hasSeenIntroductoryVideo = false,
      this.bio,
      this.photoID,
      this.gallery,
      this.posts,
      this.comments,
      this.likes});
}
