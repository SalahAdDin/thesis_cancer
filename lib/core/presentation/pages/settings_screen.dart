import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/presentation/pages/about_us_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class SettingsScreen extends StatelessWidget {
  ///
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(
        pageTitle: context.l10n!.aboutUsTitle,
      ),
      body: const AboutUsScreen(),
    );
  }
}
