import 'package:flutter/material.dart';

// TODO: How to show this without require a Scaffold? pushToPage?
class LobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // TODO: Add the logo here.
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Neredeyse oradasın!',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 40),
                    textAlign: TextAlign.center),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Başvurunuzu gözden geçirmek için biraz daha zamana ihtiyacımız var.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                // TODO: TextButton(link) to Why do I have to wait?
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Herkese açık bu uygulamalar için gereksinimleri karşılamanızı sağlamalıyız, bu nedenle hastalarımız için bir bekleme listemiz var.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Yakında size bir onay veya ret e-postası göndereceğiz! daha sonra uygulamaya girebilirsiniz.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                // TODO: TextButton(link) to cancel my application as footer.
              ],
            ),
          ),
        )
      ],
    );
  }
}
