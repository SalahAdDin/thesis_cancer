import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/application/responsive.dart';
import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/presentation/pages/profile_screen.dart';

/// Side Menu's header
class SideMenuHeader extends StatelessWidget {
  ///
  const SideMenuHeader({
    Key? key,
    required this.displayedUserName,
    required this.displayedName,
    this.userAvatarUrl,
  }) : super(key: key);

  ///
  final String displayedUserName;

  ///
  final String displayedName;

  ///
  final String? userAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: DrawerHeader(
        decoration: BoxDecoration(
          /*
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Theme.of(context).accentColor)),
              */
          color: Theme.of(context).backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {},
                onTap: () => pushToPage(context, ProfileScreen()),
                child: Row(
                  children: <Widget>[
                    UserAvatar(userAvatarUrl: userAvatarUrl),
                    Visibility(
                      visible: !isMobile(context),
                      child: Column(
                        children: <Widget>[
                          // SizedBox(width: 10),
                          Text(
                            displayedName,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(displayedUserName,
                              style: Theme.of(context).textTheme.subtitle1),
                          // SizedBox(width: 20)
                        ],
                      ),
                    ),
                  ],
                )),
            Row(
              children: <Widget>[
                Transform.rotate(
                  angle: 180 * pi / 180,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.menu_open_outlined,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
