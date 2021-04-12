import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/utils/configuration.dart';

class SideMenuFooter extends StatefulWidget {
  SideMenuFooter({Key? key}) : super(key: key);

  @override
  _SideMenuFooterState createState() => _SideMenuFooterState();
}

class _SideMenuFooterState extends State<SideMenuFooter> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

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
            child: Text(
              "${AppLiterals.title}( v${_packageInfo.version}+${_packageInfo.buildNumber})",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
