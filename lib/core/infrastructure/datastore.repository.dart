import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

class StorePath {
  static const profile = 'profile';
  static const loggedUserId = 'loggedUserId';
  static const surveys = 'surveys';
  static const settings = 'settings';
// static const surveyResults = 'results';
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
    final Map<String, dynamic> settingsJson =
        await store.record(StorePath.settings).get(database);

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
    final recordName = StorePath.settings;
    await store.record(recordName).put(database, settings.toJson());
  }

  @override
  Future<void> writeUserProfile(User user) async {
    final recordName = StorePath.profile;
    /*final Map<String, dynamic> profileJson =
        await store.record(recordName).get(database);
    if (profileJson != null) {
      final profileData = User.fromJson(profileJson);
    } else*/
    await store.record(recordName).put(database, user.toJson());
  }

  @override
  Future<bool> doesExistUserProfileWithUserName(String username) {
    // TODO: implement doesExistUserProfileWithUserName
    throw UnimplementedError();
  }

  @override
  Future<User> getUserProfileData() async {
    final Map<String, dynamic> profileJson =
        await store.record(StorePath.profile).get(database);

    return profileJson != null ? User.fromJson(profileJson) : User.empty;
  }

  @override
  Future<void> removeUserProfile() async {
    final record = store.record(StorePath.profile);
    await record.delete(database);
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
  Future<Survey> getSurvey(String id) {
    // TODO: implement getSurvey
    throw UnimplementedError();
  }

  @override
  Future<List<UserSurveyAnswer>> getSurveyAnswerBySurveyId(String id) {
    // TODO: implement getSurveyAnswerBySurveyId
    throw UnimplementedError();
  }

  @override
  Future<List<UserSurveyAnswer>> getSurveyAnswerByUserId(String id) {
    // TODO: implement getSurveyAnswerByUserId
    throw UnimplementedError();
  }

  @override
  Future<List<Survey>> getSurveys() {
    // TODO: implement getSurveys
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
  Future<void> removeSurveys() {
    // TODO: implement removeSurveys
    throw UnimplementedError();
  }

  @override
  Stream<Survey> surveyData(String surveyId) {
    // TODO: implement surveyData
    throw UnimplementedError();
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
  Stream<Survey> surveysData() {
    // TODO: implement surveysData
    throw UnimplementedError();
  }

  @override
  Stream<List<UserSurveyAnswer>> userSurveyAnswersData() {
    // TODO: implement userSurveyAnswersData
    throw UnimplementedError();
  }

  @override
  Stream<List<UserSurveyAnswer>> userSurveyAnswersBySurveyData(
      String surveyId) {
    // TODO: implement userSurveyAnswersBySurveyData
    throw UnimplementedError();
  }

  @override
  Stream<List<UserSurveyAnswer>> userSurveyAnswersByUserData(String userId) {
    // TODO: implement userSurveyAnswersByUserData
    throw UnimplementedError();
  }
}
