import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/core/application/responsive.dart';

class SideMenuHeader extends StatelessWidget {
  SideMenuHeader(
      {Key? key, required this.displayedUserName, required this.displayedName})
      : super(key: key);

  final String displayedUserName;
  final String displayedName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: DrawerHeader(
            decoration: BoxDecoration(
              /*border: Border(
                  bottom: BorderSide(
                      width: 1, color: Theme.of(context).accentColor)),*/
              color: Theme.of(context).backgroundColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: isMobile(context) ? 15 : 20,
                          child: Icon(Icons.account_circle_outlined),
                          // TODO: backgroundImage: Image.network(src),
                        ),
                        Visibility(
                          visible: !isMobile(context),
                          child: Column(
                            children: <Widget>[
                              // SizedBox(width: 10),
                              Text(
                                this.displayedName,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(this.displayedUserName,
                                  style: Theme.of(context).textTheme.subtitle1),
                              // SizedBox(width: 20)
                            ],
                          ),
                        ),
                      ],
                    )),
                Row(
                  children: <Widget>[
                    IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(MdiIcons.backburger),
                        onPressed: () => Navigator.pop(context)),
                  ],
                )
              ],
            )));
  }
}
