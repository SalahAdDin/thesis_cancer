import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_footer.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_header.dart';
import 'package:thesis_cancer/features/home/application/home.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Application's side menu.
class SideMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final StateController<User> userEntityController =
        useProvider(userEntityProvider);
    final User sessionUser = userEntityController.state;
    final StateController<PostType> tabType = useProvider(tabTypeProvider);
    final PageController pageController =
        useProvider(homePageControllerProvider).state;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SideMenuHeader(
              displayedUserName: sessionUser.username,
              displayedName: sessionUser.profile!.fullName,
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
                        leading: const Icon(Icons.book_outlined),
                        title: const Text('Bilgi'),
                        onTap: () {
                          tabType.state = PostType.INFORMATION;
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.self_improvement_outlined),
                        title: const Text('Tedavi'),
                        onTap: () {
                          tabType.state = PostType.TREATMENT;
                          pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.science_outlined),
                        title: const Text('Geliştirmeler'),
                        onTap: () {
                          tabType.state = PostType.ACADEMY;
                          pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      ListTile(
                          leading: const Icon(
                            Icons.question_answer_outlined,
                          ),
                          title: const Text('Hikayeler'),
                          onTap: () {
                            tabType.state = PostType.SUCCESS_STORIES;
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
                    onTap: () =>
                        context.read(launcherProvider.notifier).signOut(),
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
