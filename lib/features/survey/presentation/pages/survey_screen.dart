import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/completed_survey.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/question_widget.dart';

// TODO: Redirect the user to a screen
typedef FinishSurveyCallback = Future<void> Function();

class SurveyScreen extends HookWidget {
  const SurveyScreen({
    required this.onCompleteSurvey,
    required this.surveyID,
  });

  final OnPressedButton onCompleteSurvey;
  final String surveyID;

  @override
  Widget build(BuildContext context) {
    final currentSurveyState = useProvider(surveyNotifierProvider(surveyID));
    return currentSurveyState.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      completed: () => CompletedSurvey(
        onPressed: onCompleteSurvey,
        actionLabel: 'Devam et',
      ),
      data: () => SurveyWidget(
        surveyID: surveyID,
      ),
      error: (error) => ErrorScreen(
        // TODO: how to implement come back?
        onPressed: () => null,
        message:
            'Maalesef, doldurmak istediğiniz ankette bir sorun var! $error',
        title: 'Ankette Hata',
        actionLabel: 'Dönüş',
      ),
    );
  }
}

/*
* TODO: Make this more generic.
*  - Receive a survey object(or not).
*  - Receive a onTapDotIndicator function.
*  - Receive a onPressedBack function.
*  - Receive a onPressedNext function.
* */
class SurveyWidget extends HookWidget {
  const SurveyWidget({required this.surveyID});

  final String surveyID;

  @override
  Widget build(BuildContext context) {
    // We get the state(not the StateController).
    final Survey currentSurvey = useProvider(surveyEntityProvider).state;
    final currentSurveyNotifier =
        useProvider(surveyNotifierProvider(surveyID).notifier);
    final bool disabledButton = currentSurveyNotifier.isAnsweredQuestion(
        questionId: currentSurveyNotifier.questionController.state!.id);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 50.0, bottom: 20.0),
                child: Text(
                  currentSurvey.intro!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: DotsIndicator(
                            dotsCount: currentSurvey.questions!.length,
                            position: currentSurveyNotifier.currentQuestionIndex
                                .toDouble(),
                            decorator: DotsDecorator(
                              size: const Size.square(15),
                              activeSize: const Size(18, 18),
                              activeColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).disabledColor,
                            ),
                            onTap: (position) => currentSurveyNotifier
                                    .isAnsweredQuestion(
                                        questionId: currentSurveyNotifier
                                            .questionController.state!.id)
                                ? currentSurveyNotifier.goTo(position.toInt())
                                : null
                            // print("Current index: $currentQuestion");
                            ,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: QuestionWidget(
                          surveyID: surveyID,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Visibility(
                              visible:
                                  currentSurveyNotifier.currentQuestionIndex !=
                                      0,
                              child: Button.accent(
                                buttonLabel: 'Back',
                                onPressed: () =>
                                    currentSurveyNotifier.lastQuestion(),
                              ),
                            ),
                            // TODO: Disabled effect is not working
                            Button.primary(
                              buttonLabel: 'Next',
                              onPressed: disabledButton
                                  ? () => currentSurveyNotifier.nextQuestion()
                                  : null,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
