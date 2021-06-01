import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';

final pageControllerProvider = StateProvider<PageController>(
  (_) => PageController(),
  name: 'Pace Controller Provider',
);

final tabTypeProvider = StateProvider<ContentType>(
  (ref) => ContentType.INFORMATION,
  name: "Bottom Navigator Index Provider",
);

final homeScreenNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(
      dataStore: ref.watch(dataStoreRepositoryProvider),
      profileRepository: ref.watch(profileRepositoryProvider),
      userController: ref.watch(userEntityProvider.notifier),
      userRepository: ref.watch(userRepositoryProvider))
    ..init(),
  name: "Home Screen Notifier Provider",
);
