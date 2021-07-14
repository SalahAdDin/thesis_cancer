import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/user/application/profile.notifier.dart';
import 'package:thesis_cancer/features/user/application/profile.state.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/profile.repository.dart';
import 'package:thesis_cancer/features/user/infrastructure/user.repository.dart';

final Provider<ProfileRepository> profileRepositoryProvider =
    Provider<ProfileRepository>(
  (ProviderReference ref) => GraphQLProfileRepository(reader: ref.read),
  name: 'Profile Repository Provider',
);

final Provider<UserRepository> userRepositoryProvider =
    Provider<UserRepository>(
  (ProviderReference ref) => GraphQLUserRepository(reader: ref.read),
  name: 'User Repository Provider',
);

final StateProvider<User> userEntityProvider = StateProvider<User>(
  (ProviderReference ref) => User.empty,
  name: "User Entity Provider",
);

final AutoDisposeStateNotifierProviderFamily<ProfileNotifier, ProfileState,
        User> profileNotifierProvider =
    StateNotifierProvider.autoDispose
        .family<ProfileNotifier, ProfileState, User>(
  (AutoDisposeProviderReference ref, User user) =>
      ProfileNotifier(user: user, reader: ref.read),
  name: "Profile Notifier Provider",
);
