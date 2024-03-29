import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:faker/faker.dart';

class FakeSurveysFactory {
  static List<Map> mapCacheJson() => [{
      'id': faker.guid.guid(),
      'question': faker.randomGenerator.string(10),
      'date': '2020-07-20T00:00:00Z',
      'didAnswer': 'false'
    },
    {
      'id': faker.guid.guid(),
      'question': faker.randomGenerator.string(10),
      'date': '2019-02-02T00:00:00Z',
      'didAnswer': 'true'
    }
  ];

  static List<Map> makeInvalidCacheJson() => [
    {
      'id': faker.guid.guid(),
      'question': faker.randomGenerator.string(10),
      'date': 'invalid date',
      'didAnswer': 'false'
    }
  ];

  static List<Map> makeIncompleteCacheJson() => [
    {
      'date': '2020-07-20T00:00:00Z',
      'didAnswer': 'false'
    }
  ];

  static List<SurveyEntity> makeEntities() =>  [
    SurveyEntity(
      id: faker.guid.guid(),
      question: faker.randomGenerator.string(10),
      dateTime: DateTime.utc(2020, 2, 2),
      didAnswer: true
    ),
    SurveyEntity(
      id: faker.guid.guid(),
      question: faker.randomGenerator.string(10),
      dateTime: DateTime.utc(2018, 12, 20),
      didAnswer: false
    )
  ];

  static List<SurveyViewModel> makeSurveys() => [
    SurveyViewModel(id: '1', question: 'Question 1', date: 'Date 1', didAnswer: true),
    SurveyViewModel(id: '1', question: 'Question 2', date: 'Date 2', didAnswer: false),
  ];

  static List<Map> makeApiJson() => [
    {
      'id': faker.guid.guid(),
      'question': faker.randomGenerator.string(50),
      'didAnswer': faker.randomGenerator.boolean(),
      'date': faker.date.dateTime().toIso8601String()
    },
    {
      'id': faker.guid.guid(),
      'question': faker.randomGenerator.string(50),
      'didAnswer': faker.randomGenerator.boolean(),
      'date': faker.date.dateTime().toIso8601String()
    }
  ];

  static List<Map> makeInvalidApiJson() => [
    {'invalid_key': 'invalid_value'}
  ];
}