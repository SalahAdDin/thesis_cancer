import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.repository.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

// final surveyEntityProvider = StateProvider<Survey>((_)=> Survey.empty)
/*final surveyEntityProvider = FutureProvider.family<Survey, String>((ref, surveyId) async {
  Survey result = From here calling from the SurveyNotifier the fetchingSurvey function(handle both api and data store)
});*/

final StateProvider<Question?> questionEntityProvider =
    StateProvider<Question?>((_) => null, name: "Question Entity Provider");

final StateProvider<Survey> surveyEntityProvider =
    StateProvider<Survey>((_) => Survey.empty, name: "Survey Entity Provider");

final surveyRepositoryProvider = Provider<SurveyRepository>(
    (ref) => GraphQLSurveyRepository(client: ref.watch(graphQLClientProvider)),
    name: 'Survey Repository Provider');

final resultRepositoryProvider = Provider<UserSurveyResultRepository>(
    (ref) => GraphQLResultRepository(client: ref.watch(graphQLClientProvider)),
    name: 'Result Repository Provider');

// TODO: removing autoDispose could solve the warning console ?
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
