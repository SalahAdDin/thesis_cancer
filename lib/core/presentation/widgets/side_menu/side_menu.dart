import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_footer.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_header.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

class SideMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userEntityController = useProvider(userEntityProvider);
    User sessionUser = userEntityController.state;
    final AuthNotifier authNotifier =
        useProvider(authNotifierProvider.notifier);
    return Container(
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SideMenuHeader(
                displayedUserName: sessionUser.displayName,
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ExpansionTile(
                    title: Text('Content'),
                    children: <Widget>[
                      ListTile(
                          leading: Icon(MdiIcons.bookInformationVariant),
                          title: Text('Bilgi')),
                      ListTile(
                          leading: Icon(MdiIcons.meditation),
                          title: Text('Tedavi')),
                      ListTile(
                          leading: Icon(MdiIcons.flask),
                          title: Text('Geliştirmeler')),
                      ListTile(
                          leading: Icon(MdiIcons.tooltipTextOutline),
                          title: Text('Hikayeler')),
                    ],
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Ayarlar'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: Text('Çıkış yap'),
                    onTap: () => authNotifier.signOut(),
                  ),
                ],
              )),
              SideMenuFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
