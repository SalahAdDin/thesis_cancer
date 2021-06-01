import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/configuration.dart';

// TODO: could be a global(core) widget
class AppInfo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return useProvider(packageInfoProvider).when(
      data: (info) => Text(
          "${AppLiterals.title}( v${info.version}+${info.buildNumber})",
          style: const TextStyle(fontWeight: FontWeight.bold)),
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text(error.toString()),
    );
  }
}
