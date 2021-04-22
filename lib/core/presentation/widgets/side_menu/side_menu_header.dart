import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SideMenuHeader extends StatefulWidget {
  SideMenuHeader({Key? key}) : super(key: key);

  @override
  _SideMenuHeaderState createState() => _SideMenuHeaderState();
}

class _SideMenuHeaderState extends State<SideMenuHeader> {
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
                Row(
                  children: <Widget>[
                    Icon(Icons.speed),
                    SizedBox(width: 30),
                    Text('Dashboard')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Transform.rotate(
                        angle: 30 * math.pi / 180,
                        child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.push_pin_outlined),
                            onPressed: () {})),
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
