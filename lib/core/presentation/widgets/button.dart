import 'package:flutter/material.dart';
import 'package:thesis_cancer/core/domain/types.dart';

// TODO: Improve a disable button style(as in web).

class Button extends StatelessWidget {
  final String buttonLabel;
  final OnPressedButton onPressed;
  final bool isPrimary;

  const Button.primary({
    required this.buttonLabel,
    required this.onPressed,
  }) : isPrimary = true;

  const Button.accent({
    required this.buttonLabel,
    required this.onPressed,
  }) : isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isPrimary
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonLabel,
        style: isPrimary
            ? TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              )
            : const TextStyle(
                fontWeight: FontWeight.w700,
              ),
      ),
    );
  }
}
