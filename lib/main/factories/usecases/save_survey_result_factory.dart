
import 'package:forDev/data/usecases/save_survey_result/save_survey_result.dart';
import 'package:forDev/domain/entities/save_survey_result.dart';
import 'package:forDev/main/factories/factories.dart';

SaveSurveyResult makeRemoteSaveSurveyResult(String surveyId) {
  return RemoteSaveSurveyResult(
    httpClient: makeAuthorizeHttpClientDecorator(), 
    url: makeApiUrl('surveys/${surveyId}/results')
  );
}
