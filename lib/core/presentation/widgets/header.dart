import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/domain/constants.dart';

/// Application's Header
class Header extends StatelessWidget with PreferredSizeWidget {
  ///
  Header({
    Key? key,
    this.additionalActions,
    this.leading,
    this.pageTitle,
    this.title,
  }) : super(key: key);

  ///
  final String? pageTitle;

  ///
  final Widget? title;

  ///
  final Widget? leading;

  ///
  final List<Widget>? additionalActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ??
          Text(
            pageTitle ?? AppLiterals.title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
      centerTitle: true,
      leading: leading,
      // leading: const Icon(Icons.camera_alt),
      actions: <Widget>[
        ...?additionalActions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
