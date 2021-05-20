import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/auth.repository.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

final StateProvider<String> tokenProvider =
    StateProvider<String>((_) => '', name: "Token Provider");

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => GraphQLAuthRepository(client: ref.watch(graphQLClientProvider)),
    name: 'Auth Repository Provider');

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final dataStore = ref.watch(dataStoreRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(
    authRepository: authRepository,
    dataStore: dataStore,
    userController: ref.watch(userEntityProvider.notifier),
    tokenController: ref.watch(tokenProvider.notifier),
  );
}, name: "Authentication Notifier Provider");
