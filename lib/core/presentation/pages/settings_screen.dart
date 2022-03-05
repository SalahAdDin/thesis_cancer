import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thesis_cancer/core/presentation/pages/about_us_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';

///
class SettingsScreen extends StatelessWidget {
  ///
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(
        pageTitle: AppLocalizations.of(context)!.aboutUsTitle,
      ),
      body: const AboutUsScreen(),
    );
  }
}
