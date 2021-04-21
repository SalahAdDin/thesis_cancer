import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.userRepository,
    required this.userController,
  }) : super(const UserState.loading());

  final UserRepository userRepository;
  final StateController<User?> userController;

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  UserStatus assignUserStatus(User targetUser) {
    if (targetUser.isConfirmed == true) {
      if (targetUser.role == UserRole.ADMIN)
        return UserStatus.ADMIN;
      else if (targetUser.hasSeenIntroductoryVideo ==
          true) if (targetUser.hasSeenTutorial == true)
        return UserStatus.FINAL;
      else
        return UserStatus.TUTORIAL;
      else
        return UserStatus.INTRODUCTION;
    } else
      return UserStatus.UNCONFIRMED;
  }

  void deliverUserScreen() {
    UserStatus userStatus = assignUserStatus(this.userController.state!);
    switch (userStatus) {
      case UserStatus.UNCONFIRMED:
        state = UserState.unConfirmed();
        break;
      case UserStatus.ADMIN:
        state = UserState.isAdmin();
        break;
      case UserStatus.INTRODUCTION:
        state = UserState.mustSeeIntroduction();
        break;
      case UserStatus.TUTORIAL:
        state = UserState.mustSeeTutorial();
        break;
      case UserStatus.FINAL:
        state = UserState.completed();
        break;
    }
  }

  Future<void> createNewProfile(User newProfile) async {
    try {
      await userRepository.createUser(newProfile);
    } on Exception catch (error) {
      state = UserState.error(error.toString());
    }
  }

  Future<void> updateProfile(User currentProfile) async {}

  Future<void> deleteProfile(User currentProfile) async {}
}
