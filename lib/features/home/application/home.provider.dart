import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';

final StateProvider<PageController> homePageControllerProvider =
    StateProvider<PageController>(
  (_) => PageController(),
  name: 'Home Page Controller Provider',
);

final StateProvider<PostType> tabTypeProvider = StateProvider<PostType>(
  (ProviderReference ref) => PostType.INFORMATION,
  name: "Bottom Navigator Index Provider",
);

final AutoDisposeStateNotifierProvider<UserNotifier, UserState>
    homeScreenNotifierProvider =
    StateNotifierProvider.autoDispose<UserNotifier, UserState>(
  (ProviderReference ref) => UserNotifier(reader: ref.read)..init(),
  name: "Home Screen Notifier Provider",
);
