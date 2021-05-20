const String graphQLDocumentGetSettings = r'''
query Application{
  application{
    introductoryVideo{
      url
      alternativeText
      caption
      width
      height
    }
    registeringSurvey{
      id
    }
    surveySchedules{
      survey{
        id
      }
      iterations
      step
    }
  }
}
''';
