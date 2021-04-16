import 'package:flutter/material.dart';
import 'package:thesis_cancer/home/presentation/widgets/button.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen(
      {required this.onPressed,
      this.title,
      required this.message,
      required this.actionLabel});

  final Function onPressed;

  // TODO: Handle the message and only the message from AmplifyException.
  final String? title;
  final String message;
  final String actionLabel;

  // TODO: It must be a title, message and button in the lower part of the screen
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          bottom: screenSize.height * 0.5,
          left: screenSize.width * 0.3,
          right: screenSize.width * 0.3,
          child: Column(
            children: <Widget>[
              title != null
                  ? Text(title!, style: Theme.of(context).textTheme.headline1)
                  : Container(),
              SizedBox(height: 15),
              Text(message, style: Theme.of(context).textTheme.bodyText1),
              SizedBox(height: 30),
              Button.primary(buttonLabel: actionLabel, onPressed: onPressed)
            ],
          ),
        ),
      ],
    );
  }
}
