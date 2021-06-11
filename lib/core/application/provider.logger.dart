import 'package:colorize/colorize.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Logger
/// [ProviderObserver] which prints on console every change on providers.
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    Colorize string;
    if (newValue is StateController<dynamic>) {
      string = Colorize(
          '[${provider.name ?? provider.runtimeType}] value: ${newValue.state}');
    } else {
      string = Colorize(
          '[${provider.name ?? provider.runtimeType}] value: $newValue');
    }
    print(string.green());
  }
}
