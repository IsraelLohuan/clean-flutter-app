
import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/main/composites/composites.dart';
import 'package:ForDev/main/factories/factories.dart';

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