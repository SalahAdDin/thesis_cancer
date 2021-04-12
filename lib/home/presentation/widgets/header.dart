import 'package:flutter/material.dart';
import 'package:thesis_cancer/utils/configuration.dart';
import 'package:thesis_cancer/utils/responsive.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isMobile(context),
      title: Text(AppLiterals.title),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: "Logout",
            onPressed: () {
              //TODO:
            })
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
