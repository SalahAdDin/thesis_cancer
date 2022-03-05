import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/auth.repository.dart';

///
final StateProvider<String> tokenProvider = StateProvider<String>(
  (_) => '',
  name: "Token Provider",
);

///
final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
  (ProviderReference ref) => GraphQLAuthRepository(reader: ref.read),
  name: 'Auth Repository Provider',
);

///
final StateNotifierProvider<AuthNotifier, AuthState> authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ProviderReference ref) => AuthNotifier(reader: ref.read),
  name: "Authentication Notifier Provider",
);

///
final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => FirebaseAuth.instance,
  name: "FirebaseAuth Instance Provider",
);

///
final StreamProvider<User?> authStateChangesProvider = StreamProvider<User?>(
  (ProviderReference ref) {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  },
  name: " Firebase Auth Changes Provider",
);
