
import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/main/factories/factories.dart';

LoadSurveys makeRemoteLoadSurveys() {
  return RemoteLoadSurveys(
    httpClient: makeHttpAdapter(), 
    url: makeApiUrl('surveys')
  );
}