import 'package:forDev/data/http/http.dart';
import 'package:forDev/main/decorators/decorators.dart';
import 'package:forDev/main/factories/factories.dart';

HttpClient makeAuthorizeHttpClientDecorator() {
  return AuthorizeHttpClientDecorator(
    decoratee: makeHttpAdapter(), 
    fetchCacheStorage: makeSecureStorageAdapter(), 
    deleteCacheStorage: makeSecureStorageAdapter(),
  );
}