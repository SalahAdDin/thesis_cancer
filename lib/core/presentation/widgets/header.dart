import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/domain/configuration.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(pageTitle ?? AppLiterals.title),
      centerTitle: true,
      // leading: const Icon(Icons.camera_alt),
      // TODO: background color for light theme must be white.
      actions: <Widget>[
        IconButton(
            // TODO: Change this when notifications, show a red point
            icon: const Icon(Icons.notifications),
            tooltip: 'Bildirim',
            onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
