const String graphQLDocumentGetSettings = '''
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
