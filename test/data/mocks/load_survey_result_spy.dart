
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/helpers.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

class LoadSurveyResultSpy extends Mock implements LoadSurveyResult {
  When mockLoadBySurveyCall() => when(() => this.loadBySurvey(surveyId: any(named: 'surveyId')));
  void mockLoadBySurvey(SurveyResultEntity surveyResult) => this.mockLoadBySurveyCall().thenAnswer((_) async => surveyResult);
  void mockLoadBySurveyError(DomainError error) => mockLoadBySurveyCall().thenThrow(error);
}