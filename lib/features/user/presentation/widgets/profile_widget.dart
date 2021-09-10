import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/presentation/widgets/helpers.dart';

///
class ProfileWidget extends HookWidget {
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
  Widget build(BuildContext context) {
    final Profile sessionUserProfile =
        useProvider(userEntityProvider).state.profile ?? Profile.empty;
    final Profile widgetProfile = userProfile.id == sessionUserProfile.id
        ? sessionUserProfile
        : userProfile;

    return Column(
      children: <Widget>[
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
                          label: AppLocalizations.of(context)!.postNumberLabel,
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
              ? ReadMoreText(
                  widgetProfile.bio!,
                  trimMode: TrimMode.Line,
                  delimiter: ' ',
                  trimCollapsedText: AppLocalizations.of(context)!.more,
                  trimExpandedText: AppLocalizations.of(context)!.less,
                  moreStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                  lessStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.pink,
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                )
              : Container(),
        ),
      ],
    );
  }
}
