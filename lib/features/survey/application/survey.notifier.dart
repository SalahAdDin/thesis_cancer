import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

/// Survey Notifier
class SurveyNotifier extends StateNotifier<SurveyState> {
  ///
  SurveyNotifier({
    required this.reader,
    required this.surveyID,
  }) : super(const SurveyState.loading());

  /// [Reader] provider reader.
  final Reader reader;

  /// Current [Survey] id.
  final String surveyID;

  /// [Survey] [Question]'s page controller.
  PageController pageController = PageController();

  /// [SurveyRepository] to handle [Survey] API requests.
  SurveyRepository get surveyRepository => reader(surveyRepositoryProvider);

  /// [UserSurveyResultRepository] to handle [UserSurveyResult] API request.
  UserSurveyResultRepository get resultRepository =>
      reader(resultRepositoryProvider);

  /// [DataStoreRepository] to read the application's storage.
  DataStoreRepository get dataStore => reader(dataStoreRepositoryProvider);

  /// [String] current [User]'s id required to register the survey's answering user.
  String get currentUserId => reader(userEntityProvider).state.id;

  /// Survey's provider [StateController] to manipulate the current survey.
  StateController<Survey> get surveyController =>
      reader(surveyEntityProvider.notifier);

  ///
  int currentQuestionIndex = 0;

  ///
  Map<String, UserSurveyAnswer> answers = <String, UserSurveyAnswer>{};

  ///
  Future<void> fetchSurvey() async {
    try {
      final Survey result = await surveyRepository.findById(surveyID);
      surveyController.state = result;
      state = const SurveyState.data();
    } on GraphQLFailure catch (error) {
      state = SurveyState.error(error.toString());
    }
  }

  ///
  Future<void> completeSurvey() async {
    try {
      final int iteration = await resultRepository.countUserSurveyResults(
          surveyId: surveyController.state.id, userId: currentUserId);

      final UserSurveyResult userSurveyResult = UserSurveyResult(
          user: currentUserId,
          survey: surveyController.state.id,
          answers: answers.values.toList(),
          iteration: iteration + 1);
      // TODO: persists answer on locale/ cache.

      await resultRepository.createUserSurveyResult(userSurveyResult);

      state = const SurveyState.completed();
    } on Exception catch (error) {
      state = SurveyState.error(error.toString());
    }
  }

  /// Navigate to the question with [int] step index.
  void goTo(int step) {
    currentQuestionIndex = step;
    pageController.animateToPage(
      currentQuestionIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    state = const SurveyState.data();
  }

  ///
  dynamic nextQuestion() =>
      currentQuestionIndex + 1 != surveyController.state.questions?.length
          ? goTo(currentQuestionIndex + 1)
          : completeSurvey();

  ///
  void lastQuestion() {
    if (currentQuestionIndex > 0) goTo(currentQuestionIndex - 1);
  }

  ///
  void answerQuestion({
    required String questionId,
    required String answer,
    required String statement,
  }) {
    answers[questionId] =
        UserSurveyAnswer(answer: answer, statement: statement);
    state = const SurveyState.data();
  }

  ///
  void removeAnswer({
    required String questionId,
  }) {
    answers.remove(questionId);
    state = const SurveyState.data();
  }

  ///
  bool isAnsweredQuestion({required String questionId}) =>
      answers[questionId] != null;

  /* Provisional
  * TODO
  * - first from data store.
  * - second fetching from API.
  * - even getting from datastore, how can we know the survey is not outdated?
  *  */

  ///
  Future<void> init() async {
    await fetchSurvey();
  }
}
