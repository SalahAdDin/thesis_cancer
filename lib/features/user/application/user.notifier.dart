import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.dataStore,
    required this.userRepository,
    required this.userController,
    required this.profileRepository,
  }) : super(const UserState.loading());

  final DataStoreRepository dataStore;
  final UserRepository userRepository;
  final ProfileRepository profileRepository;
  final StateController<User?> userController;

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

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

  void deliverUserScreen() {
    final UserStatus userStatus = assignUserStatus(userController.state!);
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

  void hasSeenIntroductoryVideo() {
    final User? currentUser = userController.state;
    final Profile? currentUserProfile = currentUser?.profile;
    if (currentUser != null && currentUserProfile != null) {
      final Profile updatedProfile =
          currentUserProfile.copyWith(hasSeenIntroductoryVideo: true);
      final User updatedUser = currentUser.copyWith(profile: updatedProfile);
      userController.state = updatedUser;
      state = const UserState.mustSeeTutorial();
    }
  }

  // Future<Profile> getProfile(String userId) async {}

  Future<void> updateProfile(User currentProfile) async {}

  Future<void> deleteProfile(User currentProfile) async {}

  Future<void> init() async {
    final sessionUser = userController.state!;
    if (sessionUser.confirmed == true) {
      final Profile sessionUserProfile =
          await profileRepository.findByUserId(sessionUser.id);

      final sessionUserWithProfile =
          sessionUser.copyWith(profile: sessionUserProfile);

      await dataStore.writeUserProfile(sessionUserWithProfile);

      userController.state = sessionUserWithProfile;
    }

    deliverUserScreen();
  }
}
