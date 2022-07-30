
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/domain_error.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/presentation/presenters/presenters.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:ForDev/ui/pages/surveys/surveys.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';


class LoadSurveysSpy extends Mock implements LoadSurveys {}

void main() {

  LoadSurveysSpy loadSurveys;
  GetxSurveysPresenter sut;
  List<SurveyEntity> surveys;

  List<SurveyEntity> mockValidData() => [
    SurveyEntity(id: faker.guid.guid(), question: faker.lorem.sentence(), dateTime: DateTime(2020, 2, 20), didAnswer: true),
    SurveyEntity(id: faker.guid.guid(), question: faker.lorem.sentence(), dateTime: DateTime(2020, 10, 3), didAnswer: true),
  ];

  PostExpectation mockLoadSurveysCall() => when(loadSurveys.load());

  void mockLoadSurveys(List<SurveyEntity> data) {
    surveys = data;
    mockLoadSurveysCall().thenAnswer((_) async => surveys);
  }

  void mockLoadSurveysError() => mockLoadSurveysCall().thenThrow(DomainError.unexpected);

  setUp(() {
    loadSurveys = LoadSurveysSpy();
    sut = GetxSurveysPresenter(loadSurveys: loadSurveys);
    mockLoadSurveys(mockValidData());
  });

  test('Should call LoadSurveys on loadData', () async {
    await sut.loadData();

    verify(loadSurveys.load()).called(1);
  });

  test('Should emit correct events on success', () async {
    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    sut.surveysStream.listen(expectAsync1((surveys) => expect(surveys, [
      SurveyViewModel(id: surveys[0].id, question: surveys[0].question, date: '20 Fev 2020', didAnswer: surveys[0].didAnswer),
      SurveyViewModel(id: surveys[1].id, question: surveys[1].question, date: '03 Out 2018', didAnswer: surveys[1].didAnswer)
    ])));

    await sut.loadData();
  });

  test('Should emit correct events on failure', () async {
    mockLoadSurveysError();

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    sut.surveysStream.listen(null, onError: expectAsync1((error) => expect(error, UiError.unexpected.description)));

    await sut.loadData();
  });

  test('Should go to SurveyResultPage on survey click', () async {
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/survey_result/1')));

    sut.goToSurveyResult('1');
  });
}