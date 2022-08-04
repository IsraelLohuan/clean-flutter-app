
import 'package:forDev/data/cache/cache.dart';
import 'package:forDev/data/http/http.dart';
import 'package:meta/meta.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final FetchSecureCacheStorage fetchCacheStorage;
  final DeleteSecureCacheStorage deleteCacheStorage;
  final HttpClient decoratee;

  AuthorizeHttpClientDecorator({
    @required this.fetchCacheStorage,
    @required this.deleteCacheStorage,
    @required this.decoratee
  });

  @override
  Future<dynamic> request({
    @required String url,
    @required String method,
    Map body,
    Map headers
  }) async {
    try {
      final token = await fetchCacheStorage.fetch('token');
      final authorizedHeaders = headers ?? {}..addAll({'x-access-token': token});
      return await decoratee.request(url: url, method: method, body: body, headers: authorizedHeaders);
    } catch(error) {
      if(error is HttpError && error != HttpError.forbidden) {
        rethrow;
      } else {
        await deleteCacheStorage.delete('token');
        throw HttpError.forbidden;
      }
    }
  }
}