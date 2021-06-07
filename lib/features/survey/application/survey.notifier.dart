import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/application/survey.provider.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/answer/answer.entity.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

class SurveyNotifier extends StateNotifier<SurveyState> {
  SurveyNotifier({
    required this.reader,
    required this.surveyID,
  }) : super(const SurveyState.loading());

  final Reader reader;
  final String surveyID;

  SurveyRepository get surveyRepository => reader(surveyRepositoryProvider);

  UserSurveyResultRepository get resultRepository =>
      reader(resultRepositoryProvider);

  DataStoreRepository get dataStore => reader(dataStoreRepositoryProvider);

  String get currentUserId => reader(userEntityProvider).state.id;

  StateController<Survey> get surveyController =>
      reader(surveyEntityProvider.notifier);

  StateController<Question?> get questionController =>
      reader(questionEntityProvider.notifier);

  int currentQuestionIndex = 0;
  Map<String, UserSurveyAnswer> answers = {};

  Future<void> fetchSurvey() async {
    try {
      final Survey result = await surveyRepository.findById(surveyID);
      surveyController.state = result;
      state = const SurveyState.data();
    } on GraphQLFailure catch (error) {
      state = SurveyState.error(error.toString());
    }
  }

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

  void goTo(int step) {
    currentQuestionIndex = step;
    questionController.state =
        surveyController.state.questions![currentQuestionIndex];
    state = const SurveyState.data();
  }

  dynamic nextQuestion() =>
      currentQuestionIndex + 1 != surveyController.state.questions?.length
          ? goTo(currentQuestionIndex + 1)
          : completeSurvey();

  void lastQuestion() {
    if (currentQuestionIndex > 0) goTo(currentQuestionIndex - 1);
  }

  void answerQuestion({
    required String questionId,
    required String answer,
    required String statement,
  }) {
    answers[questionId] =
        UserSurveyAnswer(answer: answer, statement: statement);
    print("Answers till now: $answers");
  }

  bool isAnsweredQuestion({required String questionId}) =>
      answers[questionId] != null;

  /* Provisional
  * TODO
  * - first from data store.
  * - second fetching from API.
  * - even getting from datastore, how can we know the survey is not outdated?
  *  */
  Future<void> init() async {
    await fetchSurvey();
    if (surveyController.state != Survey.empty) {
      questionController.state = surveyController.state.questions![0];
    }
  }
}
