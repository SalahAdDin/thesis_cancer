enum ActivityType {
  LIKE,
  COMMENT,
  FOLLOW,
  NEW_POST,
  NEW_USER,
  NEW_SURVEY_ANSWER,
  NEW_SURVEY_AVAILABLE
}

enum ContentType { INFORMATION, TREATMENT, ACADEMY, SUCCESS_STORIES }

enum QuestionType { BOOL, MULTIPLE, OPEN_SHORT, OPEN_LONG, SINGLE }

enum ModuleTab { KNOWLEDGE, THERAPY, RESEARCH, STORIES }

enum SplashState { NONE, EXISTING_USER, NEW_USER }

enum UserRole { ADMIN, PILOT, TEST, CONTROL }

enum UserStatus { UNCONFIRMED, ADMIN, INTRODUCTION, TUTORIAL, FINAL }
