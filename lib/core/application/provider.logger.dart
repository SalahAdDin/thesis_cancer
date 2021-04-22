import 'package:hooks_riverpod/hooks_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    if (newValue is StateController<dynamic>)
      print(
          '[${provider.name ?? provider.runtimeType}] value: ${newValue.state}');
    else
      print('[${provider.name ?? provider.runtimeType}] value: $newValue');
  }
}
