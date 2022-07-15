import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/domain/usecases/usecases.dart';

import '../factories.dart';

AddAccount makeRemoteAddAccount() {
  return RemoteAddAccount(
    httpClient: makeHttpAdapter(), 
    url: makeApiUrl('signup')
  );
}