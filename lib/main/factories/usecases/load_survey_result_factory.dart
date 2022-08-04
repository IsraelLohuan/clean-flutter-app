
import 'package:forDev/data/usecases/load_survey_result/load_survey_result.dart';
import 'package:forDev/data/usecases/load_survey_result/remote_load_survey_result.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/main/composites/composites.dart';
import 'package:forDev/main/factories/factories.dart';

LoadSurveyResult makeRemoteLoadSurveyResult(String surveyId) {
  return RemoteLoadSurveyResult(
    httpClient: makeAuthorizeHttpClientDecorator(), 
    url: makeApiUrl('surveys/${surveyId}/results')
  );
}

LoadSurveyResult makeLocalLoadSurveyResult(String surveyId) {
  return LocalLoadSurveyResult(cacheStorage: makeLocalStorageAdapter());
}

LoadSurveyResult makeRemoteLoadSurveyResultWithLocalFallback(String surveyId) {
  return RemoteLoadSurveyResultWithLocalFallback(
    remote: makeRemoteLoadSurveyResult(surveyId),
    local: makeLocalLoadSurveyResult(surveyId)
  );
}
