import 'package:forDev/data/usecases/load_survey_result/load_survey_result.dart';
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';

class LocalLoadSurveyResultSpy extends Mock implements LocalLoadSurveyResult {

  LocalLoadSurveyResultSpy() {
    this.mockValidate();
    this.mockSave();
  }

  When mockLoadBySurveyCall() => when(() => this.loadBySurvey(surveyId: any(named: 'surveyId')));
  void mockLoadBySurvey(SurveyResultEntity surveyResult) => this.mockLoadBySurveyCall().thenAnswer((_) async => surveyResult);
  void mockLoadBySurveyError() => this.mockLoadBySurveyCall().thenThrow(DomainError.unexpected);

  When mockValidateCall() => when(() => this.validate(any()));
  void mockValidate() => this.mockValidateCall().thenAnswer((_) async => _);
  void mockValidateError() => this.mockValidateCall().thenThrow(Exception());

  When mockSaveCall() => when(() => this.save(any()));
  void mockSave() => this.mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => this.mockSaveCall().thenThrow(Exception());
}
