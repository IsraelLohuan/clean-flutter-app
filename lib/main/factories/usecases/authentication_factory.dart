import 'package:ForDev/data/usecases/remote_authentication.dart';
import 'package:ForDev/domain/usecases/authentication.dart';
import 'package:ForDev/main/factories/http/http.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(), 
    url: makeApiUrl('login')
  );
}