import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/survey/application/survey.notifier.dart';
import 'package:thesis_cancer/features/survey/application/survey.state.dart';
import 'package:thesis_cancer/features/survey/domain/result/result.repository.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.entity.dart';
import 'package:thesis_cancer/features/survey/domain/survey/survey.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/result.repository.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.repository.dart';

///
final StateProvider<Survey> surveyEntityProvider = StateProvider<Survey>(
  (_) => Survey.empty,
  name: "Survey Entity Provider",
);

///
final Provider<SurveyRepository> surveyRepositoryProvider =
    Provider<SurveyRepository>(
  (ProviderReference ref) => GraphQLSurveyRepository(reader: ref.read),
  name: 'Survey Repository Provider',
);

///
final Provider<UserSurveyResultRepository> resultRepositoryProvider =
    Provider<UserSurveyResultRepository>(
  (ProviderReference ref) => GraphQLResultRepository(reader: ref.read),
  name: 'Result Repository Provider',
);

///
final AutoDisposeStateNotifierProviderFamily<SurveyNotifier, SurveyState,
        String> surveyNotifierProvider =
    StateNotifierProvider.autoDispose
        .family<SurveyNotifier, SurveyState, String>(
  (ProviderReference ref, String surveyId) => SurveyNotifier(
    reader: ref.read,
    surveyID: surveyId,
  )..init(),
  name: "Survey Notifier Provider",
);
