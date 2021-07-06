import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/application/responsive.dart';

/// User Avatar Widget
class UserAvatar extends StatelessWidget {
  ///
  const UserAvatar({
    Key? key,
    required this.userAvatarUrl,
  }) : super(key: key);

  ///
  final String? userAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: isMobile(context) ? 15 : 20,
      backgroundImage: userAvatarUrl != null
          ? CachedNetworkImageProvider(userAvatarUrl!)
          : null,
      child: userAvatarUrl != null
          ? null
          : const Icon(Icons.account_circle_outlined),
    );
  }
}
