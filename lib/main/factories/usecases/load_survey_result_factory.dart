
import 'package:ForDev/data/usecases/load_survey_result/remote_load_survey_result.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/main/factories/factories.dart';

LoadSurveyResult makeRemoteLoadSurveyResult(String surveyId) {
  return RemoteLoadSurveyResult(
    httpClient: makeAuthorizeHttpClientDecorator(), 
    url: makeApiUrl('surveys/${surveyId}/results')
  );
}