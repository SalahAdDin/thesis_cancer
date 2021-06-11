import 'package:hooks_riverpod/hooks_riverpod.dart';
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
