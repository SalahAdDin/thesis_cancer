import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/presentation/widgets/app_info.dart';

/// Side Menu's footer.
class SideMenuFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
