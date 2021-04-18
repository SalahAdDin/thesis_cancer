import 'package:thesis_cancer/core/domain/types.dart';

class ActivityFeed {
  final String? id;
  final ActivityType? type;
  final String? userID;
  final String? postID;

  const ActivityFeed({this.id, this.type, this.userID, this.postID});
}
