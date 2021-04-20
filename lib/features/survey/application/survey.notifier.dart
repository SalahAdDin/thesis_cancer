import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/usersurveyanswer.entity.dart';
import 'package:uuid/uuid.dart';

class SurveyNotifier extends StateNotifier<SurveyState> {
  SurveyNotifier(
      {required this.currentSurvey,
      required this.currentUserId,
      // required this.surveyRepository,
      // required this.userSurveyAnswerRepository,
      required this.dataStore})
      : super(const SurveyState.loading()) {
    init();
  }

  Uuid uuid = Uuid();

  // final SurveyRepository surveyRepository;
  // final UserSurveyAnswerRepository userSurveyAnswerRepository;
  final DataStoreRepository dataStore;
  final Survey currentSurvey;
  final String currentUserId;

  late int currentQuestionIndex;
  late Map<String, String> answers;

  Future<void> completeSurvey() async {
    try {
      UserSurveyAnswer userSurveyAnswer = UserSurveyAnswer(
          id: uuid.v4(),
          userId: this.currentUserId,
          surveyId: this.currentSurvey.id,
          answers: answers,
          iteration: 0);
      // TODO: sent to GraphQL API.
      // TODO: persists answer on locale.
      print("User answer $userSurveyAnswer");
      state = SurveyState.completed();
    } on Exception catch (error) {
      state = SurveyState.error(error.toString());
    }
  }

  goTo(int step) => this.currentQuestionIndex = step;

  nextQuestion() =>
      this.currentQuestionIndex + 1 != currentSurvey.questions?.length
          ? goTo(this.currentQuestionIndex + 1)
          : completeSurvey();

  lastQuestion() {
    if (this.currentQuestionIndex > 0) goTo(this.currentQuestionIndex - 1);
  }

  answerQuestion({required String questionId, required String answer}) =>
      this.answers[questionId] = answer;

  bool isAnsweredQuestion({required String questionId}) =>
      this.answers[questionId] != null ? true : false;

  /* Provisional
  * TODO: how to handle this with get the survey by ID
  *  - first from data store
  * - second fetching from API.
  * - even getting from datastore, how can we know the survey is not outdated?
  * TODO: how to check the iteration number?
  *  */
  void init() {
    this.currentQuestionIndex = 0;
    this.answers = {};
    state = SurveyState.data();
  }
}
