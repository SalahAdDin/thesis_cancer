import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:uuid/uuid.dart';

class SurveyNotifier extends StateNotifier<SurveyState> {
  SurveyNotifier(
      {required this.currentSurvey,
      required this.currentUserId,
      required this.questionController,
      // required this.surveyRepository,
      // required this.userSurveyAnswerRepository,
      required this.dataStore})
      : super(const SurveyState.data());

  Uuid uuid = Uuid();

  // final SurveyRepository surveyRepository;
  // final UserSurveyAnswerRepository userSurveyAnswerRepository;
  final DataStoreRepository dataStore;
  final Survey currentSurvey;
  final String currentUserId;

  final StateController<Question?> questionController;

  int currentQuestionIndex = 0;
  Map<String, String> answers = {};

  Future<void> completeSurvey() async {
    try {
      final int iteration = await resultRepository.countUserSurveyResults(
          surveyId: this.surveyController.state.id, userId: this.currentUserId);

      UserSurveyResult userSurveyResult = UserSurveyResult(
          id: uuid.v4(),
          user: this.currentUserId,
          survey: this.surveyController.state.id,
          answers: answers.values.toList(),
          iteration: iteration + 1);
      // TODO: persists answer on locale/ cache.
      print("User answer $userSurveyResult");

      await resultRepository.createUserSurveyResult(userSurveyResult);

      state = SurveyState.completed();
    } on Exception catch (error) {
      state = SurveyState.error(error.toString());
    }
  }

  goTo(int step) {
    this.currentQuestionIndex = step;
    questionController.state =
        this.currentSurvey.questions![this.currentQuestionIndex];
    state = SurveyState.data();
  }

  nextQuestion() =>
      this.currentQuestionIndex + 1 != currentSurvey.questions?.length
          ? goTo(this.currentQuestionIndex + 1)
          : completeSurvey();

  lastQuestion() {
    if (this.currentQuestionIndex > 0) goTo(this.currentQuestionIndex - 1);
  }

  /*answerQuestion({required String questionId, required String answer}) =>
      this.answers[questionId] = answer;
*/

  answerQuestion(
      {required String questionId,
      required String answer,
      required String statement}) {
    this.answers[questionId] =
        UserSurveyAnswer(answer: answer, statement: statement);
    print("Answers till now: ${this.answers}");
  }

  bool isAnsweredQuestion({required String questionId}) =>
      this.answers[questionId] != null ? true : false;

  /* Provisional
  * TODO: how to handle this with get the survey by ID
  *  - first from data store
  * - second fetching from API.
  * - even getting from datastore, how can we know the survey is not outdated?
  * TODO: how to check the iteration number?
  *  */
  Future<void> init() async {
    questionController.state = this.currentSurvey.questions![0];
  }
}
