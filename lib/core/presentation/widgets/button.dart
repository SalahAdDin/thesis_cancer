import 'package:flutter/material.dart';

///
class Button extends StatelessWidget {
  ///
  const Button.primary({
    required this.buttonLabel,
    required this.onPressed,
  }) : isPrimary = true;

  ///
  const Button.accent({
    required this.buttonLabel,
    required this.onPressed,
  }) : isPrimary = false;

  ///
  final String buttonLabel;

  ///
  final VoidCallback? onPressed;

  ///
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return isPrimary
        ? ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonLabel),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            child: Text(buttonLabel),
          );
  }
}
