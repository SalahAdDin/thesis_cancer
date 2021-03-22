import 'package:thesis_cancer/utils/types.dart';

class Post {
  final String id;
  final ContentType type;
  final String content;
  final String userID;
  final Map comments;
  final Map likes;
  final Map media;

  const Post(
      {this.id,
      this.type,
      this.content,
      this.userID,
      this.comments,
      this.likes,
      this.media});
}
