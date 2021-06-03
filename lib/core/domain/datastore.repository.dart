import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

abstract class DataStoreRepository {
  // Settings
  Future<void> writeSettings(Settings settings);

  Future<void> removeSettings();

  Future<Settings> getSettings();

  // User
  Future<void> writeUserProfile(User user);

  Future<void> removeUserProfile();

  Future<User> getUserProfileData();

  Future<bool> doesExistUserProfileWithUserName(String username);

  // Surveys

  // TODO: this would require a cache provider for surveys.
  Future<List<Survey>> getSurveys();

  Future<void> removeSurveys();

  Stream<Survey> surveysData();

  Future<void> writeSurvey(Survey survey);

  Future<void> removeSurvey(String id);

  Stream<Survey> surveyData(String id);

  Future<Survey> getSurvey(String id);

  Future<bool> doesExistSurveyWithId(String id);

  // Survey Result
  Future<void> writeSurveyResult(UserSurveyAnswer surveyAnswer);

  Future<void> removeSurveyResult(String id);

  Future<UserSurveyResult> getSurveyResult(String id);

  Future<bool> doesExistSurveyAnswerBySurveyId(String id);

  Future<bool> doesExistSurveyAnswerByUserId(String id);

  // Posts
  Future<void> writePost(Post post);

  Future<void> writePosts({
    required ContentType type,
    required List<Post> posts,
  });

  Future<List<Post>> getPosts(ContentType type);

  Future<void> removePost(Post post);

  Future<void> removePosts();
}
