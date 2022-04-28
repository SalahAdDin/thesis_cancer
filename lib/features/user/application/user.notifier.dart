import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/settings.notifier.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
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

  ProfileRepository get _profileRepository => reader(profileRepositoryProvider);

  FirebaseAnalytics get _firebaseAnalytics => reader(firebaseAnalyticsProvider);

  FirebaseMessaging get _firebaseMessaging =>
      reader(firebaseMessagingInstanceProvider);

  ///
  StateController<User?> get _userController =>
      reader(userEntityProvider.notifier);

  SettingsNotifier get _settingsController =>
      reader(settingsNotifierProvider.notifier);

  Settings? get _settings => _settingsController.state;

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
      if (targetUser.profile?.role == UserRole.ADMIN) {
        return UserStatus.ADMIN;
      } else {
        if (targetUser.profile?.hasSeenIntroductoryVideo == true) {
          if (targetUser.profile?.role == UserRole.CONTROL) {
            return UserStatus.UNCONFIRMED;
          } else if (targetUser.profile?.hasSeenTutorial == true) {
            return UserStatus.FINAL;
          } else {
            return UserStatus.TUTORIAL;
          }
        } else {
          return UserStatus.INTRODUCTION;
        }
      }
    } else {
      return UserStatus.UNCONFIRMED;
    }
  }

  /// Delivers a screen based on the [UserStatus] assigned.
  void deliverUserScreen() {
    final User targetUser = _userController.state!;
    final UserStatus userStatus = assignUserStatus(targetUser);
    switch (userStatus) {
      case UserStatus.UNCONFIRMED:
        if (targetUser.profile?.role == UserRole.CONTROL) {
          state = const UserState.unConfirmed(mode: LobbyMode.CONTROL);
        } else {
          state = const UserState.unConfirmed();
        }
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

      if (updatedProfile.role == UserRole.CONTROL) {
        state = const UserState.unConfirmed(mode: LobbyMode.CONTROL);
      } else {
        state = const UserState.mustSeeTutorial();
      }
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

    if (sessionUser.confirmed == true &&
        sessionUser.profile?.role == UserRole.GUEST) {
      try {
        final Profile sessionUserProfile =
            await _profileRepository.findByUserId(sessionUser.id);

        final User sessionUserWithProfile = sessionUser.copyWith(
          profile: sessionUserProfile,
        );

        await _dataStore.writeUserProfile(sessionUserWithProfile);

        if (_settings != null && _settings!.surveySchedules != null) {
          final List<SurveySchedule> userRelatedSurveys = _settings!
              .surveySchedules!
              .where(
                (SurveySchedule schedule) =>
                    EnumToString.convertToString(schedule.role) ==
                        EnumToString.convertToString(sessionUserProfile.role) ||
                    schedule.role == RoleOptions.ALL,
              )
              .toList();

          _settingsController.scheduleNotifications(userRelatedSurveys);
        }

        _userController.state = sessionUserWithProfile;
      } on GraphQLFailure catch (error) {
        state = UserState.error(error);
      } on ProfileFailure catch (error) {
        state = UserState.error(error);
      }
    }
    await _firebaseAnalytics.setUserId(
      id: _userController.state!.profile?.uid ?? 'guest_user',
    );
    await _firebaseAnalytics.setUserProperty(
      name: 'backend_user_id',
      value: _userController.state!.id,
    );

    if (sessionUser.profile?.role == UserRole.ADMIN) {
      await _firebaseMessaging.subscribeToTopic('admins');
    }

    deliverUserScreen();
  }
}
