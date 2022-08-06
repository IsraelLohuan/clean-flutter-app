
import 'package:forDev/data/usecases/usecases.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/main/composites/composites.dart';
import 'package:forDev/main/factories/factories.dart';

RemoteLoadSurveys makeRemoteLoadSurveys() {
  return RemoteLoadSurveys(
    httpClient: makeAuthorizeHttpClientDecorator(), 
    url: makeApiUrl('surveys')
  );
}

LocalLoadSurveys makeLocalLoadSurveys() {
  return LocalLoadSurveys(cacheStorage: makeLocalStorageAdapter());
}


LoadSurveys makeRemoteLoadSurveysWithLocalFallback() {
  return RemoteLoadSurveysWithLocalFallback(
    remote: makeRemoteLoadSurveys(),
    local: makeLocalLoadSurveys(), 
  );
}