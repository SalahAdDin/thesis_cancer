import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/presentation/widgets/app_info.dart';

/// Side Menu's footer.
class SideMenuFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).accentColor)),
      ),
      width: double.infinity,
      child: Align(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: AppInfo(),
        ),
      ),
    );
  }
}
