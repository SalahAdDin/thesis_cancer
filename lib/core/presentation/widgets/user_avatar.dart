import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// User Avatar Widget
class UserAvatar extends StatelessWidget {
  ///
  const UserAvatar({
    Key? key,
    required this.userAvatarUrl,
    this.radius = 15,
  }) : super(key: key);

  ///
  final String? userAvatarUrl;

  ///ZZ
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: userAvatarUrl != null
          ? CachedNetworkImageProvider(userAvatarUrl!)
          : null,
      child: userAvatarUrl != null
          ? null
          : const Icon(Icons.account_circle_outlined),
    );
  }
}
