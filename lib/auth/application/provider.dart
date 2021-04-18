import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/auth/infrastructure/auth.repository.dart';
import 'package:thesis_cancer/core/application/provider.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AmplifyAuthRepository());

final authNotifierProvider = StateNotifierProvider<AuthNotifier>((ref) {
  final dataStore = ref.watch(dataStoreRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository: authRepository, dataStore: dataStore);
});
