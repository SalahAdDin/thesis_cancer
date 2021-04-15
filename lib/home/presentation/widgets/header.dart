import 'package:flutter/material.dart';
import 'package:thesis_cancer/utils/configuration.dart';
import 'package:thesis_cancer/utils/responsive.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    Key? key,
    required this.displayedUserName,
    this.pageTitle,
  }) : super(key: key);

  final String displayedUserName;
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
        GestureDetector(
            onTap: () {},
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: isMobile(context) ? 10 : 15,
                  child: Icon(Icons.account_circle_outlined),
                  // TODO: backgroundImage: Image.network(src),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  this.displayedUserName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )),
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
