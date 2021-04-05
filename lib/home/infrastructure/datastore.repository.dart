import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:thesis_cancer/home/domain/datastore.repository.dart';
import 'package:thesis_cancer/user/domain/user.entity.dart';

class StorePath {
  static const profile = 'profile';
  static const loggedUserId = 'loggedUserId';
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
  Stream<User> userProfileData() {
    final record = store.record(StorePath.profile);
    return record.onSnapshot(database).map((snapshot) =>
        snapshot?.value != null ? User.fromJson(snapshot?.value) : User.empty);
  }
}
