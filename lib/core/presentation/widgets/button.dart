import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  final bool isPrimary;

  Button.primary({
    required this.buttonLabel,
    required this.onPressed,
  }) : isPrimary = true;

  Button.accent({
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
        shape: isPrimary
            ? null
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).disabledColor,
                ),
              ),
      ),
      onPressed: () => onPressed,
      child: Text(
        buttonLabel,
        style: isPrimary
            ? TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              )
            : TextStyle(
                fontWeight: FontWeight.w700,
              ),
      ),
    );
  }
}
