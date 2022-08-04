import 'package:forDev/data/usecases/authentication/remote_authentication.dart';
import 'package:forDev/domain/usecases/authentication.dart';
import 'package:forDev/main/factories/http/http.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(), 
    url: makeApiUrl('login')
  );
}