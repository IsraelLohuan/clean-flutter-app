import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/main/decorators/decorators.dart';
import 'package:ForDev/main/factories/factories.dart';

HttpClient makeAuthorizeHttpClientDecorator() {
  return AuthorizeHttpClientDecorator(
    decoratee: makeHttpAdapter(), 
    fetchSecureCacheStorage: makeSecureStorageAdapter()
  );
}