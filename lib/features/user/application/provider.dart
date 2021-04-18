import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/user.api.repository.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => AmplifyGraphQLUserRepository());

final userEntityProvider = Provider<User>((ref) => User.empty);

final homeScreenProvider = StateNotifierProvider<UserNotifier>((ref) {
  final userEntity = ref.watch(userEntityProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return UserNotifier(currentUser: userEntity, userRepository: userRepository);
});
