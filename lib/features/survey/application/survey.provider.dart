import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey.entity.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:uuid/uuid.dart';

// final surveyEntityProvider = StateProvider<Survey>((_)=> Survey.empty)
/*final surveyEntityProvider = FutureProvider.family<Survey, String>((ref, surveyId) async {
  Survey result = From here calling from the SurveyNotifier the fetchingSurvey function(handle both api and data store)
});*/
// TODO: Provisional
Uuid uuid = Uuid();
Survey mockSurvey = Survey(
  title: 'Kaydetme Anketi',
  id: uuid.v4(),
  intro:
      'Bu anket, cevapladığınız için teşekkürler, teknik gösteri amacıyla hazırlanmıştır.',
);

List<Question> questions = [
  Question(
    id: uuid.v4(),
    statement: 'Şu an kemoterapi tedavisi alıyor musunuz?',
    type: QuestionType.BOOL,
    surveyID: mockSurvey.id,
  ),
  Question(
      id: uuid.v4(),
      statement: 'Kaç kür kematerapi aldınız?',
      type: QuestionType.SINGLE,
      answer: '1,2,3,4,5 ve üzeri',
      surveyID: mockSurvey.id),
  Question(
      id: uuid.v4(),
      statement: 'Kanser tanısını ilk defa mı aldınız?',
      type: QuestionType.BOOL,
      surveyID: mockSurvey.id)
];

final StateProvider<Question?> questionEntityProvider =
    StateProvider<Question?>((_) => null, name: "Question Entity Provider");

final StateProvider<Survey> surveyEntityProvider = StateProvider<Survey>(
    (_) => mockSurvey.copyWith(questions: questions),
    name: "Survey Entity Provider");

final surveyNotifierProvider =
    StateNotifierProvider.autoDispose<SurveyNotifier, SurveyState>((ref) {
  // TODO: It should be a general userProvider and not just related to MainScreen
  User currentUser = ref.watch(userEntityProvider).state;
  Survey currentSurvey = ref.read(surveyEntityProvider).state;
  DataStoreRepository dataStore = ref.watch(dataStoreRepositoryProvider);

  // ref.read(questionEntityProvider).state = currentSurvey.questions![0];
  return SurveyNotifier(
      currentSurvey: currentSurvey,
      currentUserId: currentUser.id,
      questionController: ref.watch(questionEntityProvider.notifier),
      // surveyRepository: surveyRepository,
      // userSurveyAnswerRepository: userSurveyAnswerRepository,
      dataStore: dataStore)
    ..init();
}, name: "Survey Notifier Provider");
