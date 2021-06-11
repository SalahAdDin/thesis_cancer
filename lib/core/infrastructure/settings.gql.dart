///
const String graphQLDocumentGetSettings = '''
query Application{
  application{
    introductoryVideo{
      url
      alternativeText
      caption
      width
      height
      previewUrl
      mime
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
