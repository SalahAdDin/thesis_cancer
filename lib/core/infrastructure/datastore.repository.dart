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

class StorePath {
  static const profile = 'profile';
  static const loggedUserId = 'loggedUserId';
  static const surveys = 'surveys';
  static const settings = 'settings';
  static const posts = 'posts';
  static const surveyResults = 'results';

  static String postByContentType(String type) => 'posts/$type';
}

class SembastDataStore implements DataStoreRepository {
  static DatabaseFactory databaseFactory = databaseFactoryIo;

  SembastDataStore(this.database);

  final Database database;
  final store = StoreRef.main();

  static Future<SembastDataStore> makeDefault() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return SembastDataStore(
        await databaseFactory.openDatabase('${appDocDir.path}/default.db'));
  }

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
    final record = store.record(StorePath.settings);
    await record.delete(database);
  }

  @override
  Future<void> writeSettings(Settings settings) async {
    const recordName = StorePath.settings;
    await store.record(recordName).put(database, settings.toJson());
  }

  @override
  Future<void> writeUserProfile(User user) async {
    const recordName = StorePath.profile;
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
  Future<List<Post>> getPosts(ContentType type) async {
    final recordName =
        StorePath.postByContentType(EnumToString.convertToString(type));
    final List<dynamic>? postsJson =
        await store.record(recordName).get(database) as List<dynamic>?;

    final List<Post> result = postsJson != null
        ? postsJson
            .map((element) => Post.fromJson(element as Map<String, dynamic>))
            .toList()
        : [];

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
            .map((element) => Survey.fromJson(element as Map<String, dynamic>))
            .toList()
        : [];

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
    final record = store.record(StorePath.surveys);
    await record.delete(database);
  }

  @override
  Future<void> removeUserProfile() async {
    final record = store.record(StorePath.profile);
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
    required ContentType type,
    required List<Post> posts,
  }) async {
    final recordName =
        StorePath.postByContentType(EnumToString.convertToString(type));
    final String encodedPosts =
        posts.map((element) => element.toJson()).toList().toString();

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
    final record = store.record(StorePath.posts);
    await record.delete(database);
  }
}
