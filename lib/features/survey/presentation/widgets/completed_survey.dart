import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';

class CompletedSurvey extends StatelessWidget {
  final onPressedButton onPressed;
  final String actionLabel;

  const CompletedSurvey(
      {Key? key, required this.onPressed, required this.actionLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(maxWidth: 350),
            decoration: const BoxDecoration(
                color: Colors.transparent,
                boxShadow: [BoxShadow(blurRadius: 4, offset: Offset(4, 8))],
                borderRadius: const BorderRadius.all(Radius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Teşekkür ederiz',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 40),
                      textAlign: TextAlign.center),
                  SizedBox(height: 15),
                  Text(
                    'Anketimize verdiğiniz yanıtları aldık, bu anketi doldurmak için ayırdığınız zaman için teşekkür ederiz.',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Button.primary(buttonLabel: actionLabel, onPressed: onPressed)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
