/// Notification ([ActivityFeed]) type.
enum ActivityType {
  NEW_COMMENT,
  NEW_FOLLOW,
  NEW_LIKE,
  NEW_POST,
  NEW_SURVEY_SCHEDULED,
  NEW_RECOMMENDATION
}

///
enum FileType { image, video, file }

/// [Post] type.
enum PostType { INFORMATION, TREATMENT, ACADEMY, SUCCESS_STORIES }

/// [Question] type.
enum QuestionType { BOOL, MULTIPLE, OPEN_SHORT, OPEN_LONG, SINGLE }

/// User [Profile] role.
enum UserRole { ADMIN, PILOT, TEST, CONTROL, GUEST }

/// User status.
enum UserStatus { UNCONFIRMED, ADMIN, INTRODUCTION, TUTORIAL, FINAL }

/// General [OnPressedButton] callback function.
typedef OnPressedButton = void Function();
