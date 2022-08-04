import 'package:forDev/data/usecases/usecases.dart';
import 'package:forDev/domain/usecases/usecases.dart';

import '../factories.dart';

AddAccount makeRemoteAddAccount() {
  return RemoteAddAccount(
    httpClient: makeHttpAdapter(), 
    url: makeApiUrl('signup')
  );
}