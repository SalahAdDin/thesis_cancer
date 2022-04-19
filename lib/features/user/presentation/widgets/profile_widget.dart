import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/presentation/widgets/helpers.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class ProfileWidget extends HookConsumerWidget {
  ///
  const ProfileWidget({
    Key? key,
    required this.userProfile,
    this.postsCount = 0,
  }) : super(key: key);

  ///
  final Profile userProfile;

  ///
  final int postsCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Profile sessionUserProfile =
        ref.watch(userEntityProvider).profile ?? Profile.empty;
    final Profile widgetProfile = userProfile.id == sessionUserProfile.id
        ? sessionUserProfile
        : userProfile;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Visibility(
            visible: widgetProfile.fullName == '',
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.warning_outlined,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Expanded(
                      child: Text(
                        context.l10n!.profileNoNameWarning,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 14.0,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                UserAvatar(
                  userAvatarUrl: widgetProfile.profilePhoto?.url,
                  radius: 40,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              widgetProfile.fullName,
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          StatsColumn(
                            label: context.l10n!.postNumberLabel,
                            number: postsCount,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: widgetProfile.bio != null
                ? MarkdownBody(data: widgetProfile.bio!)
                : Container(),
          ),
        ],
      ),
    );
  }
}
