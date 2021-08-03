import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

///
typedef DynamicCallback = Function(dynamic);

///
class CarouselSwitcherButton extends HookWidget {
  ///
  CarouselSwitcherButton({
    required this.values,
    required this.onPressed,
    required this.icons,
    this.initialValue,
    this.padding = const EdgeInsets.all(8.0),
    this.constraints,
  })  : assert(
          values.length == icons.length,
          "The list of icons must match the list of values.",
        ),
        assert(
          values.runtimeType.toString() ==
              "List<${initialValue.runtimeType.toString()}>",
          "The initial value must have the same type as the list of values.",
        );

  /// [List] of values for the button state.
  /// The button will navigate from the above to next value in circular way.
  final List<dynamic> values;

  /// [List] of [Icon] matching the values order and length.
  final List<Icon> icons;

  /// Initial value for the button state.
  final dynamic initialValue;

  /// The padding around button's icon.
  final EdgeInsetsGeometry padding;

  /// Optional size constraints for the button.
  final BoxConstraints? constraints;

  /// Callback function to be executed on pressing button.
  final DynamicCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> index = useState(values.indexOf(initialValue));

    void _onPressed() {
      index.value = (index.value + 1) % values.length;
      onPressed(values[index.value]);
    }

    Widget _deliverIcon() => icons[index.value];

    return IconButton(
      padding: padding,
      constraints: constraints,
      onPressed: _onPressed,
      icon: _deliverIcon(),
    );
  }
}
