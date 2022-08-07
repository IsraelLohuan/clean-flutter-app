import 'package:forDev/data/usecases/load_survey_result/load_survey_result.dart';
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';

class RemoteLoadSurveyResultSpy extends Mock implements RemoteLoadSurveyResult {
  When mockLoadBySurveyCall() => when(() => this.loadBySurvey(surveyId: any(named: 'surveyId')));
  void mockLoadBySurvey(SurveyResultEntity surveyResult) => this.mockLoadBySurveyCall().thenAnswer((_) async => surveyResult);
  void mockLoadBySurveyError(DomainError error) => mockLoadBySurveyCall().thenThrow(error);
}