import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/button.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/completed_survey_screen.dart';
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
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Survey Screen: $surveyID",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
      },
      const <Object>[],
    );

    return currentSurveyState.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      // TODO: It could be custom or Navigator.of(context).pop() ?
      completed: () => CompletedSurveyScreen(
        onPressed: onCompleteSurvey,
        actionLabel: AppLocalizations.of(context)!.next,
      ),
      data: () => SurveyWidget(
        surveyID: surveyID,
      ),
      error: (Failure? error) => ErrorScreen(
        onPressed: () => Navigator.of(context).maybePop(),
        reason: error?.reason,
        actionLabel: AppLocalizations.of(context)!.back,
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
    final SurveyNotifier surveyNotifier =
        context.read(surveyNotifierProvider(surveyID).notifier);

    final List<Question>? surveyQuestions = currentSurvey.questions;
    final int currentQuestionIndex = surveyNotifier.currentQuestionIndex;
    bool answeredQuestion(int index) =>
        surveyQuestions != null &&
        surveyNotifier.isAnsweredQuestion(
          questionId: surveyQuestions[index].id,
        );

    return Scaffold(
      appBar: Header(
        pageTitle: currentSurvey.title,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (currentSurvey.intro != null)
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          else
            Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: surveyQuestions != null &&
                          surveyQuestions.isNotEmpty
                      ? <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: DotsIndicator(
                                dotsCount: surveyQuestions.length,
                                position: currentQuestionIndex.toDouble(),
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
                                        ? surveyNotifier.goTo(position.toInt())
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
                                controller: surveyNotifier.pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: surveyQuestions
                                    .map(
                                      (Question question) => QuestionWidget(
                                        question: question,
                                        surveyID: surveyID,
                                        userAnswer:
                                            surveyNotifier.answers[question.id],
                                        onSelected: (String answer) =>
                                            surveyNotifier.answerQuestion(
                                          questionId: question.id,
                                          answer: answer,
                                          statement: question.statement,
                                        ),
                                        onRemove: () =>
                                            surveyNotifier.removeAnswer(
                                          questionId: question.id,
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
                                  visible: currentQuestionIndex != 0,
                                  child: Button.accent(
                                    buttonLabel:
                                        AppLocalizations.of(context)!.back,
                                    onPressed: () =>
                                        surveyNotifier.lastQuestion(),
                                  ),
                                ),
                                Button.primary(
                                  buttonLabel:
                                      AppLocalizations.of(context)!.next,
                                  onPressed:
                                      answeredQuestion(currentQuestionIndex)
                                          ? () => surveyNotifier.nextQuestion()
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
                              AppLocalizations.of(context)!.noQuestionsSurvey,
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
