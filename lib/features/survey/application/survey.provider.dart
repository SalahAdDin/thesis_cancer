import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/question/question.entity.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.repository.dart';

final questionEntityProvider = StateProvider<Question?>(
  (_) => null,
  name: "Question Entity Provider",
);

final StateProvider<Survey> surveyEntityProvider = StateProvider<Survey>(
  (_) => Survey.empty,
  name: "Survey Entity Provider",
);

final surveyRepositoryProvider = Provider<SurveyRepository>(
  (ref) => GraphQLSurveyRepository(reader: ref.read),
  name: 'Survey Repository Provider',
);

final resultRepositoryProvider = Provider<UserSurveyResultRepository>(
  (ref) => GraphQLResultRepository(reader: ref.read),
  name: 'Result Repository Provider',
);

// TODO: removing autoDispose could solve the warning console ?
final surveyNotifierProvider =
    StateNotifierProvider.family<SurveyNotifier, SurveyState, String>(
  // TODO: It should be a general userProvider and not just related to MainScreen
  (ref, surveyId) => SurveyNotifier(
    reader: ref.read,
    surveyID: surveyId,
  )..init(),
  name: "Survey Notifier Provider",
);
