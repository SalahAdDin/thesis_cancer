import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';

/// User Notifier
/// Handles business logic related to the application session's user.
class UserNotifier extends StateNotifier<UserState> {
  /// Notifier constructor
  /// Receives a [Reader] from which notifier will get all dependencies.
  /// Throws the initialization function.
  UserNotifier({
    required this.reader,
  }) : super(const UserState.loading());

  ///
  final Reader reader;

  ///
  DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  // UserRepository get _userRepository => reader(userRepositoryProvider);

  ///
  ProfileRepository get _profileRepository => reader(profileRepositoryProvider);

  ///
  StateController<User?> get _userController =>
      reader(userEntityProvider.notifier);

  ///
  User? get currentUser => _userController.state;

  ///
  Profile? get currentUserProfile => currentUser?.profile;

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  /// Assigns a user status based on user and user profile conditions
  UserStatus assignUserStatus(User targetUser) {
    if (targetUser.confirmed == true) {
      /*
      if (targetUser.role == UserRole.ADMIN)
        return UserStatus.ADMIN;
      else
      */
      if (targetUser.profile?.hasSeenIntroductoryVideo == true) {
        if (targetUser.profile?.hasSeenTutorial == true) {
          return UserStatus.FINAL;
        } else {
          return UserStatus.TUTORIAL;
        }
      } else {
        return UserStatus.INTRODUCTION;
      }
    } else {
      return UserStatus.UNCONFIRMED;
    }
  }

  /// Delivers a screen based on the [UserStatus] assigned.
  void deliverUserScreen() {
    final UserStatus userStatus = assignUserStatus(_userController.state!);
    switch (userStatus) {
      case UserStatus.UNCONFIRMED:
        state = const UserState.unConfirmed();
        break;
      case UserStatus.ADMIN:
        state = const UserState.isAdmin();
        break;
      case UserStatus.INTRODUCTION:
        state = const UserState.mustSeeIntroduction();
        break;
      case UserStatus.TUTORIAL:
        state = const UserState.mustSeeTutorial();
        break;
      case UserStatus.FINAL:
        state = const UserState.completed();
        break;
    }
  }

  ///
  Future<void> hasSeenIntroductoryVideo() async {
    if (currentUser != null && currentUserProfile != null) {
      final Profile updatedProfile =
          currentUserProfile!.copyWith(hasSeenIntroductoryVideo: true);
      await updateProfile(updatedProfile);
      state = const UserState.mustSeeTutorial();
    }
  }

  ///
  Future<void> hasSeenTutorial() async {
    if (currentUser != null && currentUserProfile != null) {
      final Profile updatedProfile =
          currentUserProfile!.copyWith(hasSeenTutorial: true);
      await updateProfile(updatedProfile);
      state = const UserState.completed();
    }
  }

  // Future<Profile> getProfile(String userId) async {}

  ///
  Future<void> updateProfile(Profile updatedProfile) async {
    try {
      final Profile fetchedUpdatedProfile =
          await _profileRepository.updateProfile(
        updatedProfile: updatedProfile,
      );
      final User updatedUser =
          currentUser!.copyWith(profile: fetchedUpdatedProfile);
      await _dataStore.writeUserProfile(updatedUser);
      _userController.state = updatedUser;
    } on ProfileFailure catch (error) {
      state = UserState.error(error);
    }
  }

  ///
  Future<void> deleteProfile(User currentProfile) async {}

  ///
  Future<void> init() async {
    final User sessionUser = _userController.state!;
    final String? firebaseUserUID = sessionUser.profile?.uid;
    if (sessionUser.confirmed == true &&
        sessionUser.profile?.role == UserRole.GUEST) {
      try {
        final Profile sessionUserProfile =
            await _profileRepository.findByUserId(sessionUser.id);

        final User sessionUserWithProfile = sessionUser.copyWith(
          profile: sessionUserProfile.copyWith(uid: firebaseUserUID),
        );

        await _dataStore.writeUserProfile(sessionUserWithProfile);

        _userController.state = sessionUserWithProfile;

        deliverUserScreen();
      } on GraphQLFailure catch (error) {
        state = UserState.error(error);
      } on ProfileFailure catch (error) {
        state = UserState.error(error);
      }
    }
  }
}
