import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/auth.repository.dart';

final StateProvider<String> tokenProvider = StateProvider<String>(
  (_) => '',
  name: "Token Provider",
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => GraphQLAuthRepository(reader: ref.read),
  name: 'Auth Repository Provider',
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(reader: ref.read),
  name: "Authentication Notifier Provider",
);
