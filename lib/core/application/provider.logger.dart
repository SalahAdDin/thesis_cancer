import 'package:colorize/colorize.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Logger
/// [ProviderObserver] which prints on console every change on providers.
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    Colorize title;
    Colorize value;
    if (newValue is StateController<dynamic>) {
      title = Colorize('[${provider.name ?? provider.runtimeType}]\n');
      value = Colorize('\tValue: ${newValue.state}');
    } else {
      title = Colorize('[${provider.name ?? provider.runtimeType}]\n');
      value = Colorize('\tValue: $newValue');
    }
    if (kDebugMode) {
      print('${title.yellow()}${value.green()}');
    }
  }
}
