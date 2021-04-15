import 'package:flutter/material.dart';
import 'package:thesis_cancer/home/presentation/widgets/button.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({required this.onPressed, this.title, required this.message});

  final Function onPressed;

  // TODO: Handle the message and only the message from AmplifyException.
  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        title != null
            ? Positioned(
                child:
                    Text(title!, style: Theme.of(context).textTheme.headline1),
              )
            : Container(),
        Positioned(
          child: Text(message, style: Theme.of(context).textTheme.bodyText1),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.3,
          right: MediaQuery.of(context).size.width * 0.3,
          child: Button.primary(buttonLabel: 'Home', onPressed: onPressed),
        ),
      ],
    );
  }
}
