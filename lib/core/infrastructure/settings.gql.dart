import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/features/media/infrastructure/upload_file.gql.dart';

/// GraphQL Fragment containing the fetching required attributes for [Settings] query/mutation.
const String graphQLDocumentGetSettings = '''
$graphQLFragmentBody
query Application{
  application{
    introductoryVideo{
      role
      video{
        ...UploadFileFields
      }
    }
    registeringSurvey{
      id
    }
    surveySchedules{
      label
      survey{
        id
      }
      iterations
      step
    }
  }
}
''';
