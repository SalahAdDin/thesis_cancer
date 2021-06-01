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

final StateProvider<Question?> questionEntityProvider =
    StateProvider<Question?>(
  (_) => null,
  name: "Question Entity Provider",
);

final StateProvider<Survey> surveyEntityProvider = StateProvider<Survey>(
  (_) => Survey.empty,
  name: "Survey Entity Provider",
);

final surveyRepositoryProvider = Provider<SurveyRepository>(
  (ref) => GraphQLSurveyRepository(client: ref.watch(graphQLClientProvider)),
  name: 'Survey Repository Provider',
);

final resultRepositoryProvider = Provider<UserSurveyResultRepository>(
  (ref) => GraphQLResultRepository(client: ref.watch(graphQLClientProvider)),
  name: 'Result Repository Provider',
);

// TODO: removing autoDispose could solve the warning console ?
final surveyNotifierProvider =
    StateNotifierProvider.family<SurveyNotifier, SurveyState, String>(
  (ref, surveyId) {
    // TODO: It should be a general userProvider and not just related to MainScreen
    final User currentUser = ref.watch(userEntityProvider).state;
    final DataStoreRepository dataStore =
        ref.watch(dataStoreRepositoryProvider);
    return SurveyNotifier(
        surveyController: ref.watch(surveyEntityProvider.notifier),
        questionController: ref.watch(questionEntityProvider.notifier),
        surveyRepository: ref.watch(surveyRepositoryProvider),
        resultRepository: ref.watch(resultRepositoryProvider),
        currentUserId: currentUser.id,
        surveyID: surveyId,
        dataStore: dataStore)
      ..init();
  },
  name: "Survey Notifier Provider",
);
