import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';

const String accessDenied =
    'assets/svg/errors/undraw_access_denied_re_awnf.svg';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    required this.onPressed,
    this.title,
    required this.message,
    required this.actionLabel,
  });

  final VoidCallback onPressed;

  // TODO: Handle the message and only the message from Exceptions.
  final String? title;
  final String message;
  final String actionLabel;

  // TODO: It must be a title, message and button in the lower part of the screen
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Widget accessDeniedSVG = SvgPicture.asset(
      accessDenied,
      semanticsLabel: 'Access Denied Error',
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: accessDeniedSVG,
          ),
          Positioned(
            bottom: screenSize.height * 0.05,
            left: screenSize.width * 0.3,
            right: screenSize.width * 0.3,
            child: Column(
              children: <Widget>[
                if (title != null)
                  Text(
                    title!,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  )
                else
                  Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Button.primary(
                    buttonLabel: actionLabel,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
