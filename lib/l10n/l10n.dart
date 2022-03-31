import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension on BuildContext to make easier
/// to get localization context on each widget
extension AppLocalizationsX on BuildContext {
  /// Localization instance from context
  AppLocalizations? get l10n => AppLocalizations.of(this);
}
