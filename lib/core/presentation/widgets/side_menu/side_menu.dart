import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_footer.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_header.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/home/application/home.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

class SideMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userEntityController = useProvider(userEntityProvider);
    final User sessionUser = userEntityController.state;
    final AuthNotifier authNotifier =
        useProvider(authNotifierProvider.notifier);
    final tabType = useProvider(tabTypeProvider);
    final PageController pageController =
        useProvider(pageControllerProvider).state;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SideMenuHeader(
              displayedUserName: sessionUser.username,
              displayedName:
                  "${sessionUser.profile?.firstName} ${sessionUser.profile?.lastName}",
              userAvatarUrl: sessionUser.profile!.profilePhoto?.url,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ExpansionTile(
                    title: const Text('Content'),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(MdiIcons.bookInformationVariant),
                        title: const Text('Bilgi'),
                        onTap: () {
                          tabType.state = ContentType.INFORMATION;
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(MdiIcons.meditation),
                        title: const Text('Tedavi'),
                        onTap: () {
                          tabType.state = ContentType.TREATMENT;
                          pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(MdiIcons.flask),
                        title: const Text('Geliştirmeler'),
                        onTap: () {
                          tabType.state = ContentType.ACADEMY;
                          pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      ListTile(
                          leading: const Icon(MdiIcons.tooltipTextOutline),
                          title: const Text('Hikayeler'),
                          onTap: () {
                            tabType.state = ContentType.SUCCESS_STORIES;
                            pageController.animateToPage(
                              3,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Ayarlar'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Çıkış yap'),
                    onTap: () => authNotifier.signOut(),
                  ),
                ],
              ),
            ),
            SideMenuFooter(),
          ],
        ),
      ),
    );
  }
}
