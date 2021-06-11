import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';

class CompletedSurvey extends StatelessWidget {
  const CompletedSurvey({
    Key? key,
    required this.onPressed,
    required this.actionLabel,
  }) : super(key: key);

  final OnPressedButton onPressed;
  final String actionLabel;

  // TODO: Improve style
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350),
                decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(blurRadius: 4, offset: Offset(4, 8))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      Text('Teşekkür ederiz',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 40),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 15),
                      Text(
                        'Anketimize verdiğiniz yanıtları aldık, bu anketi doldururken ayırdığınız zaman için teşekkür ederiz.',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Button.primary(
                          buttonLabel: actionLabel, onPressed: onPressed)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
