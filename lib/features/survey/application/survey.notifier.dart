import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/failure.dart';
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
  SurveyRepository get _surveyRepository => reader(surveyRepositoryProvider);

  /// [UserSurveyResultRepository] to handle [UserSurveyResult] API request.
  UserSurveyResultRepository get _resultRepository =>
      reader(resultRepositoryProvider);

  /// [DataStoreRepository] to read the application's storage.
  // DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  /// [String] current [User]'s id required to register the survey's answering user.
  String get _currentUserId => reader(userEntityProvider).id;

  /// Survey's provider [StateController] to manipulate the current survey.
  StateController<Survey> get _surveyController =>
      reader(surveyEntityProvider.notifier);

  ///
  int currentQuestionIndex = 0;

  ///
  Map<String, UserSurveyAnswer> answers = <String, UserSurveyAnswer>{};

  ///
  Future<void> fetchSurvey() async {
    try {
      final Survey result = await _surveyRepository.findById(surveyID);
      _surveyController.state = result;
      state = const SurveyState.data();
    } on SurveyFailure catch (error) {
      state = SurveyState.error(error);
    } on Exception catch (_) {
      state = SurveyState.error(
        SurveyFailure(reason: SurveyFailureReason.unknown),
      );
    }
  }

  ///
  Future<void> completeSurvey() async {
    try {
      final int iteration = await _resultRepository.countUserSurveyResults(
        surveyId: _surveyController.state.id,
        userId: _currentUserId,
      );

      final UserSurveyResult userSurveyResult = UserSurveyResult(
        user: _currentUserId,
        survey: _surveyController.state.id,
        answers: answers.values.toList(),
        iteration: iteration + 1,
      );
      // TODO: persists answer on locale/cache.

      await _resultRepository.createUserSurveyResult(userSurveyResult);

      state = const SurveyState.completed();
    } on ResultFailure catch (error) {
      state = SurveyState.error(error);
    } on Exception catch (_) {
      state = SurveyState.error(
        SurveyFailure(reason: SurveyFailureReason.unknown),
      );
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
    state = SurveyState.data(step);
  }

  ///
  dynamic nextQuestion() =>
      currentQuestionIndex + 1 != _surveyController.state.questions?.length
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
    state = SurveyState.data(int.parse(questionId));
  }

  ///
  void removeAnswer({
    required String questionId,
  }) {
    answers.remove(questionId);
    state = SurveyState.data(int.parse(questionId));
  }

  ///
  bool isAnsweredQuestion({required String questionId}) =>
      answers[questionId] != null;

  /* Provisional
  * TODO:
  * - first from data store.
  * - second fetching from API.
  * - even getting from datastore, how can we know the survey is not outdated?
  *  */

  ///
  Future<void> init() async {
    await fetchSurvey();
  }
}
