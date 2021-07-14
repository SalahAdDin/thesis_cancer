import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/presentation/pages/profile_screen.dart';

/// [PostWidget]'s header.
class PostHeader extends StatelessWidget {
  ///
  const PostHeader({
    required this.author,
    Key? key,
  }) : super(key: key);

  ///
  final User author;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(userAvatarUrl: author.profile?.profilePhoto?.url),
      title: GestureDetector(
        onTap: () => pushToPage(
          context,
          ProfileScreen(user: author),
        ),
        child: Text(
          author.profile!.fullName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // subtitle: Text(this.location),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
