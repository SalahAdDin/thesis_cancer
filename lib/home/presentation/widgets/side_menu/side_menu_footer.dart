import 'package:flutter/material.dart';
import 'package:thesis_cancer/home/presentation/widgets/app_info.dart';

class SideMenuFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: Theme.of(context).accentColor))),
      width: double.infinity,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10),
            child: AppInfo(),
          )),
    );
  }
}
