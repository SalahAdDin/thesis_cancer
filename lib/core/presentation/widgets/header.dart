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
      actions: <Widget>[
        IconButton(
            // TODO: Change this when notifications, show a red point
            icon: Icon(Icons.notifications),
            tooltip: 'Bildirim',
            onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
