import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/domain/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/completed_survey.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/question_widget.dart';

// TODO: Redirect the user to a screen
typedef FinishSurveyCallback = Future<void> Function();

class SurveyScreen extends HookWidget {
  SurveyScreen({required this.onCompleteSurvey});

  final Function onCompleteSurvey;

  @override
  Widget build(BuildContext context) {
    final currentSurveyState = useProvider(surveyNotifierProvider);
    return currentSurveyState.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      completed: () => CompletedSurvey(
        onPressed: onCompleteSurvey,
        actionLabel: 'Teslim et',
      ),
      data: () => SurveyWidget(),
      error: (error) => ErrorScreen(
        // TODO: how to implement come back?
        onPressed: () {},
        message:
            'Maalesef, doldurmak istediğiniz ankette bir sorun var! $error',
        title: 'Ankette Hata',
        actionLabel: 'Dönüş',
      ),
    );
  }
}

class SurveyWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final Survey currentSurvey = useProvider(surveyEntityProvider).state;
    Question currentQuestion = useProvider(questionEntityProvider).state;
    final currentSurveyNotifier = useProvider(surveyNotifierProvider.notifier);
    return SingleChildScrollView(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Center(
                    child: DotsIndicator(
                      dotsCount: currentSurvey.questions!.length,
                      position:
                          currentSurveyNotifier.currentQuestionIndex.toDouble(),
                      decorator: DotsDecorator(
                        size: Size.square(15),
                        activeSize: Size(18, 18),
                        activeColor: Theme.of(context).primaryColor,
                        color: Theme.of(context).disabledColor,
                      ),
                      onTap: (position) {
                        currentSurveyNotifier.goTo(position.toInt());
                        currentQuestion = currentSurvey.questions![
                            currentSurveyNotifier.currentQuestionIndex];
                        // print("Current index: $currentQuestion");
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  QuestionWidget(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Visibility(
                          // currentQuestionIndex
                          visible:
                              currentSurveyNotifier.currentQuestionIndex != 0,
                          child: Button.accent(
                            buttonLabel: 'Back',
                            // nextQuestion
                            onPressed: () =>
                                currentSurveyNotifier.lastQuestion(),
                          ),
                        ),
                        // TODO: check if there is answer.
                        // TODO: lastQuestion
                        Button.primary(
                          buttonLabel: 'Next',
                          /*onPressed: userHasAnsweredCurrentQuestion
                              ? onNextButtonPressed
                              : null,*/
                          onPressed: () =>
                              currentSurveyNotifier.isAnsweredQuestion(
                                      questionId: currentSurvey
                                          .questions![currentSurveyNotifier
                                              .currentQuestionIndex]
                                          .id)
                                  ? currentSurveyNotifier.nextQuestion()
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
    );
  }
}
