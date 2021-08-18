import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';

/// Provide a controller for a [User] and its related [Profile].
final AutoDisposeStateNotifierProvider<UserNotifier, UserState>
    homeScreenNotifierProvider =
    StateNotifierProvider.autoDispose<UserNotifier, UserState>(
  (ProviderReference ref) => UserNotifier(reader: ref.read)..init(),
  name: "Home Screen Notifier Provider",
);
