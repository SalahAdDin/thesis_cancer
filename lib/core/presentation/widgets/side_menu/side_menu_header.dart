import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/core/presentation/widgets/carousel_switcher_button.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/presentation/pages/profile_screen.dart';

///
typedef DynamicCallback = Function(dynamic);

/// Side Menu's header
class SideMenuHeader extends StatelessWidget {
  ///
  const SideMenuHeader({
    Key? key,
    required this.sessionUser,
    required this.themeMode,
    this.toggleThemeMode,
  }) : super(key: key);

  ///
  final User sessionUser;

  ///
  final ThemeMode themeMode;

  ///
  final DynamicCallback? toggleThemeMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.5,
          horizontal: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              key: GlobalKeys().userNameButtonKey,
              onTap: () => pushToPage(
                context,
                ProfileScreen(
                  user: sessionUser,
                ),
              ),
              child: Row(
                children: <Widget>[
                  UserAvatar(
                    userAvatarUrl: sessionUser.profile!.profilePhoto?.url,
                  ),
                  Container(
                    /* Width
                    * avatar: 30
                    * right action buttons: 68
                    * main row: 245
                    * */
                    width: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // SizedBox(width: 10),
                        Text(
                          sessionUser.profile!.shortName,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 14),
                        ),
                        Text(
                          sessionUser.username,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 10),
                        ),
                        // SizedBox(width: 20)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Visibility(
                  visible: toggleThemeMode != null,
                  child: CarouselSwitcherButton(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    constraints: const BoxConstraints(minWidth: 10),
                    values: ThemeMode.values,
                    icons: const <Icon>[
                      Icon(Icons.settings_outlined),
                      Icon(Icons.light_mode_outlined),
                      Icon(Icons.dark_mode_outlined)
                    ],
                    onPressed: (dynamic value) => toggleThemeMode!(value),
                    initialValue: themeMode,
                  ),
                ),
                Transform.rotate(
                  angle: 180 * pi / 180,
                  child: IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    constraints: const BoxConstraints(minWidth: 10),
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
