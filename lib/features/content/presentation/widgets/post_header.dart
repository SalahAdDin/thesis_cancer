import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';

/// [PostWidget]'s header.
class PostHeader extends StatelessWidget {
  ///
  const PostHeader({
    required this.author,
    Key? key,
  }) : super(key: key);

  ///
  final Profile author;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar(userAvatarUrl: author.profilePhoto?.url),
      title: GestureDetector(
        // TODO: Go to profile
        onTap: () => null,
        child: Text(
          author.fullName,
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
