import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_footer.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu_header.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SideMenuHeader(),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ExpansionTile(
                    title: Text("Administration"),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          MdiIcons.accountGroupOutline,
                          // size: 40,
                        ),
                        title: Text('Users'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.poll),
                        title: Text('Surveys'),
                        onTap: () {},
                      ),
                      ListTile(
                          leading: Icon(MdiIcons.cogs), title: Text('Setup')),
                    ],
                  ),
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
                  )
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
