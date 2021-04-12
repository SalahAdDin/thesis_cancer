import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thesis_cancer/utils/helpers.dart';
import 'package:thesis_cancer/utils/responsive.dart';

class SideMenuHeader extends StatefulWidget {
  SideMenuHeader({Key? key, required this.displayedUserName}) : super(key: key);
  final String displayedUserName;

  @override
  _SideMenuHeaderState createState() => _SideMenuHeaderState();
}

class _SideMenuHeaderState extends State<SideMenuHeader> {
  late final Color _avatarBackgroundColor;

  @override
  void initState() {
    super.initState();
    _avatarBackgroundColor = Colors.primaries[Random().nextInt(
      Colors.primaries.length,
    )];
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).accentColor))),
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  height: 130,
                ),
                CircleAvatar(
                  radius: isMobile(context) ? 15 : 35,
                  // TODO: How to get the name initials
                  child: Text(getInitials(widget.displayedUserName)),
                  // TODO: backgroundImage: Image.network(src),
                  backgroundColor: this._avatarBackgroundColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    child: Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          widget.displayedUserName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ))
              ],
            )
          ],
        ));
  }
}
