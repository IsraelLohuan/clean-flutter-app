
import 'package:forDev/data/usecases/usecases.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/main/composites/composites.dart';
import 'package:forDev/main/factories/factories.dart';

LoadSurveys makeRemoteLoadSurveys() {
  return RemoteLoadSurveys(
    httpClient: makeAuthorizeHttpClientDecorator(), 
    url: makeApiUrl('surveys')
  );
}

LoadSurveys makeLocalLoadSurveys() {
  return LocalLoadSurveys(cacheStorage: makeLocalStorageAdapter());
}


LoadSurveys makeRemoteLoadSurveysWithLocalFallback() {
  return RemoteLoadSurveysWithLocalFallback(
    remote: makeRemoteLoadSurveys(),
    local: makeLocalLoadSurveys(), 
  );
}