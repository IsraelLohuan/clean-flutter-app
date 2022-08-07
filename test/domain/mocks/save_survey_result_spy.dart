
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/domain_error.dart';
import 'package:mocktail/mocktail.dart';

class SaveSurveyResultSpy extends Mock implements SaveSurveyResult {
  When mockSaveSurveyResultCall() => when(() => this.save(answer: any(named: 'answer')));
  void mockSaveSurveyResult(SurveyResultEntity data) => mockSaveSurveyResultCall().thenAnswer((_) async => data);
  void mockSaveSurveyResultError(DomainError error) => mockSaveSurveyResultCall().thenThrow(error);
}
