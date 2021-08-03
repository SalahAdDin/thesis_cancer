import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/completed_survey.dart';
import 'package:thesis_cancer/features/survey/presentation/widgets/question_widget.dart';

/// Survey Screen
class SurveyScreen extends HookWidget {
  ///
  const SurveyScreen({
    required this.onCompleteSurvey,
    required this.surveyID,
  });

  ///
  final VoidCallback onCompleteSurvey;

  ///
  final String surveyID;

  @override
  Widget build(BuildContext context) {
    final SurveyState currentSurveyState =
        useProvider(surveyNotifierProvider(surveyID));
    return currentSurveyState.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      // TODO: Redirect the user to a screen
      completed: () => CompletedSurvey(
        onPressed: onCompleteSurvey,
        actionLabel: 'Devam et',
      ),
      data: () => SurveyWidget(
        surveyID: surveyID,
      ),
      error: (String error) => ErrorScreen(
        // TODO: how to implement come back?
        onPressed: () => Navigator.of(context).pop(),
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

/// Survey Widget
class SurveyWidget extends HookWidget {
  ///
  const SurveyWidget({required this.surveyID});

  ///
  final String surveyID;

  @override
  Widget build(BuildContext context) {
    // We get the state(not the StateController).
    final Survey currentSurvey = useProvider(surveyEntityProvider).state;

    bool answeredQuestion(int index) => context
        .read(surveyNotifierProvider(surveyID).notifier)
        .isAnsweredQuestion(
          questionId: currentSurvey.questions![index].id,
        );

    return Scaffold(
      appBar: Header(
        pageTitle: currentSurvey.title,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
              bottom: 20.0,
            ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: currentSurvey.questions != null &&
                          currentSurvey.questions!.isNotEmpty
                      ? <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: DotsIndicator(
                                dotsCount: currentSurvey.questions!.length,
                                position: context
                                    .read(surveyNotifierProvider(surveyID)
                                        .notifier)
                                    .currentQuestionIndex
                                    .toDouble(),
                                decorator: DotsDecorator(
                                  size: const Size.square(15),
                                  activeSize: const Size(18, 18),
                                  activeColor: Theme.of(context).primaryColor,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.12),
                                ),
                                onTap: (double position) =>
                                    answeredQuestion(position.toInt())
                                        ? context
                                            .read(
                                                surveyNotifierProvider(surveyID)
                                                    .notifier)
                                            .goTo(position.toInt())
                                        : null
                                // print("Current index: $currentQuestion");
                                ,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: PageView(
                                controller: context
                                    .read(surveyNotifierProvider(surveyID)
                                        .notifier)
                                    .pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: currentSurvey.questions!
                                    .map(
                                      (Question question) => QuestionWidget(
                                        question: question,
                                        surveyID: surveyID,
                                        userAnswer: context
                                            .read(
                                                surveyNotifierProvider(surveyID)
                                                    .notifier)
                                            .answers[question.id],
                                        onSelected: (String answer) => context
                                            .read(
                                                surveyNotifierProvider(surveyID)
                                                    .notifier)
                                            .answerQuestion(
                                              questionId: question.id,
                                              answer: answer,
                                              statement: question.statement,
                                            ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Visibility(
                                  visible: context
                                          .read(surveyNotifierProvider(surveyID)
                                              .notifier)
                                          .currentQuestionIndex !=
                                      0,
                                  child: Button.accent(
                                    buttonLabel: 'Back',
                                    onPressed: () => context
                                        .read(surveyNotifierProvider(surveyID)
                                            .notifier)
                                        .lastQuestion(),
                                  ),
                                ),
                                Button.primary(
                                  buttonLabel: 'Next',
                                  onPressed: answeredQuestion(context
                                          .read(surveyNotifierProvider(surveyID)
                                              .notifier)
                                          .currentQuestionIndex)
                                      ? () => context
                                          .read(surveyNotifierProvider(surveyID)
                                              .notifier)
                                          .nextQuestion()
                                      : null,
                                )
                              ],
                            ),
                          ),
                        ]
                      : <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 8.0),
                            child: Text(
                              'Bu anketinin soruları hala yok!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 25),
                            ),
                          ),
                        ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
