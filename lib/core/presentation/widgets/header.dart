import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/features/notification/presentation/pages/notifications_screen.dart';

/// Application's Header
class Header extends StatelessWidget with PreferredSizeWidget {
  ///
  Header({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  ///
  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(pageTitle ?? AppLiterals.title),
      centerTitle: true,
      // leading: const Icon(Icons.camera_alt),
      // TODO: background color for light theme must be white.
      actions: <Widget>[
        Badge(
          animationType: BadgeAnimationType.scale,
          // TODO: watch the ActivityFeed stream controller for its list's length
          // To change the content when the length change.
          // badgeContent: BuildContext,
          // TODO: same above, if length is 0, hide the badge.
          // showBadge: ,
          child: IconButton(
            key: GlobalKeys().notificationButtonKey,
            icon: const Icon(Icons.notifications),
            tooltip: 'Bildirim',
            onPressed: () => pushToPage(context, NotificationsScreen()),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
