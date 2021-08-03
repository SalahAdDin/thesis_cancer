import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/constants.dart';

/// Application's basic information widget.
class AppInfo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return useProvider(packageInfoProvider).when(
      data: (PackageInfo info) => Text(
        "${AppLiterals.title} (v${info.version}+${info.buildNumber})",
        style: const TextStyle(
          // fontWeight: FontWeight.bold,
          color: Colors.black38,
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (Object error, _) => Text(error.toString()),
    );
  }
}
