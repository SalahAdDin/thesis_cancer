import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/provider.dart';
import 'package:thesis_cancer/utils/configuration.dart';

class SideMenuFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: Theme.of(context).accentColor))),
      width: double.infinity,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10),
            child: AppInfo(),
          )),
    );
  }
}

// TODO: could be a global(core) widget
class AppInfo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return useProvider(packageInfoProvider).when(
      data: (info) => Text(
          "${AppLiterals.title}( v${info.version}+${info.buildNumber})",
          style: TextStyle(fontWeight: FontWeight.bold)),
      loading: () => CircularProgressIndicator(),
      error: (error, _) => Text(error.toString()),
    );
  }
}
