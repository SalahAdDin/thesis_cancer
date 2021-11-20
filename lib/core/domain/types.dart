/// Notification ([ActivityFeed]) type.
enum ActivityType {
  NEW_COMMENT,
  NEW_FOLLOW,
  NEW_LIKE,
  NEW_POST,
  NEW_SURVEY_SCHEDULED,
  NEW_RECOMMENDATION,
  NEW_REGISTERED_USER
}

///
enum FileType { image, video, file }

///
enum TargetIdentifier {
  informationTarget,
  treatmentTarget,
  academyTarget,
  successStoriesTarget,
  sideMenuTarget
}

/// [Post] type.
enum PostType { INFORMATION, TREATMENT, ACADEMY, SUCCESS_STORIES }

/// [Question] type.
enum QuestionType { BOOL, MULTIPLE, OPEN_SHORT, OPEN_LONG, SINGLE }

/// User [Profile] role.
enum UserRole { ADMIN, PILOT, TEST, CONTROL, GUEST }

/// User [Profile] role options for switch cases.
enum RoleOptions {
  ALL,
  PILOT,
  TEST,
  CONTROL,
}

/// User status.
enum UserStatus { UNCONFIRMED, ADMIN, INTRODUCTION, TUTORIAL, FINAL }
