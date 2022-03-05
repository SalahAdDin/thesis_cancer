import 'dart:io';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/content/domain/post/post.entity.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Store Path literals
class StorePath {
  StorePath._();

  /// Path for [Profile]
  static const String profile = 'profile';

  // static const String loggedUserId = 'loggedUserId';

  /// Path for [Survey] list.
  static const String surveys = 'surveys';

  /// Path for [Settings].
  static const String settings = 'settings';

  /// Path for grouped [Post] lists.
  static const String posts = 'posts';

  /// Path for [UserSurveyResult] lists.
  static const String surveyResults = 'results';

  /// Path for [Post] group.
  static String postByContentType(String type) => 'posts/$type';
}

/// [SembastDataStore] implementation for [DataStoreRepository] interface.
class SembastDataStore implements DataStoreRepository {
  ///
  SembastDataStore(this.database);

  ///
  static DatabaseFactory databaseFactory = databaseFactoryIo;

  ///
  final Database database;

  ///
  final StoreRef<String, dynamic> store = StoreRef<String, dynamic>.main();

  ///
  static Future<SembastDataStore> makeDefault() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    return SembastDataStore(
      await databaseFactory.openDatabase('${appDocDir.path}/default.db'),
    );
  }

  ///
  static Future<SembastDataStore> init(String databasePath) async =>
      SembastDataStore(await databaseFactory.openDatabase(databasePath));

  @override
  Future<Settings> getSettings() async {
    final Map<String, dynamic>? settingsJson = await store
        .record(StorePath.settings)
        .get(database) as Map<String, dynamic>?;

    return settingsJson != null
        ? Settings.fromJson(settingsJson)
        : Settings.empty;
  }

  @override
  Future<void> removeSettings() async {
    final RecordRef<dynamic, dynamic> record = store.record(StorePath.settings);
    await record.delete(database);
  }

  @override
  Future<void> writeSettings(Settings settings) async {
    const String recordName = StorePath.settings;
    await store.record(recordName).put(database, settings.toJson());
  }

  @override
  Future<void> writeUserProfile(User user) async {
    const String recordName = StorePath.profile;
    await store.record(recordName).put(database, user.toJson());
  }

  @override
  Future<bool> doesExistUserProfileWithUserName(String username) {
    // TODO: implement doesExistUserProfileWithUserName
    throw UnimplementedError();
  }

  @override
  Future<User> getUserProfileData() async {
    final Map<String, dynamic>? profileJson = await store
        .record(StorePath.profile)
        .get(database) as Map<String, dynamic>?;

    return profileJson != null ? User.fromJson(profileJson) : User.empty;
  }

  @override
  Future<bool> doesExistSurveyAnswerBySurveyId(String id) {
    // TODO: implement doesExistSurveyAnswerBySurveyId
    throw UnimplementedError();
  }

  @override
  Future<bool> doesExistSurveyAnswerByUserId(String id) {
    // TODO: implement doesExistSurveyAnswerByUserId
    throw UnimplementedError();
  }

  @override
  Future<bool> doesExistSurveyWithId(String id) {
    // TODO: implement doesExistSurveyWithId
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts(PostType type) async {
    final String recordName =
        StorePath.postByContentType(EnumToString.convertToString(type));
    final List<dynamic>? postsJson =
        await store.record(recordName).get(database) as List<dynamic>?;

    final List<Post> result = postsJson != null
        ? postsJson
            .map(
              (dynamic element) =>
                  Post.fromJson(element as Map<String, Object>),
            )
            .toList()
        : <Post>[];

    return result;
  }

  @override
  Future<Survey> getSurvey(String id) {
    // TODO: implement getSurvey
    throw UnimplementedError();
  }

  @override
  Future<UserSurveyResult> getSurveyResult(String id) {
    // TODO: implement getSurveyResult
    throw UnimplementedError();
  }

  @override
  Future<List<Survey>> getSurveys() async {
    final List<dynamic>? surveysJson =
        await store.record(StorePath.surveys).get(database) as List<dynamic>?;

    final List<Survey> result = surveysJson != null
        ? surveysJson
            .map(
              (dynamic element) =>
                  Survey.fromJson(element as Map<String, dynamic>),
            )
            .toList()
        : <Survey>[];

    return result;
  }

  @override
  Future<void> removePost(Post post) {
    // TODO: implement removePost
    throw UnimplementedError();
  }

  @override
  Future<void> removeSurvey(String id) {
    // TODO: implement removeSurvey
    throw UnimplementedError();
  }

  @override
  Future<void> removeSurveyResult(String id) {
    // TODO: implement removeSurveyResult
    throw UnimplementedError();
  }

  @override
  Future<void> removeSurveys() async {
    final RecordRef<dynamic, dynamic> record = store.record(StorePath.surveys);
    await record.delete(database);
  }

  @override
  Future<void> removeUserProfile() async {
    final RecordRef<dynamic, dynamic> record = store.record(StorePath.profile);
    await record.delete(database);
  }

  @override
  Stream<Survey> surveyData(String id) {
    // TODO: implement surveyData
    throw UnimplementedError();
  }

  @override
  Stream<Survey> surveysData() {
    // TODO: implement surveysData
    throw UnimplementedError();
  }

  @override
  Future<void> writePost(Post post) async {}

  @override
  Future<void> writePosts({
    required PostType type,
    required List<Post> posts,
  }) async {
    final String recordName =
        StorePath.postByContentType(EnumToString.convertToString(type));
    final String encodedPosts =
        posts.map((Post element) => element.toJson()).toList().toString();

    await store.record(recordName).put(database, encodedPosts);
  }

  @override
  Future<void> writeSurvey(Survey survey) {
    // TODO: implement writeSurvey
    throw UnimplementedError();
  }

  @override
  Future<void> writeSurveyResult(UserSurveyAnswer surveyAnswer) {
    // TODO: implement writeSurveyResult
    throw UnimplementedError();
  }

  @override
  Future<void> removePosts() async {
    final RecordRef<dynamic, dynamic> record = store.record(StorePath.posts);
    await record.delete(database);
  }
}
