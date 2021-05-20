import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/user.repository.dart';

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => AmplifyGraphQLUserRepository(),
    name: 'User Repository Provider');

final StateProvider<User> userEntityProvider =
    StateProvider<User>((ref) => User.empty, name: "User Entity Provider");

final homeScreenNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserNotifier(
      userController: ref.watch(userEntityProvider.notifier),
      userRepository: userRepository)
    ..deliverUserScreen();
}, name: "Home Screen Notifier Provider");
