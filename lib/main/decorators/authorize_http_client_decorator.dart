
import 'package:ForDev/data/cache/cache.dart';
import 'package:ForDev/data/http/http.dart';
import 'package:meta/meta.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final FetchSecureCacheStorage fetchSecureCacheStorage;
  final HttpClient decoratee;

  AuthorizeHttpClientDecorator({
    @required this.fetchSecureCacheStorage,
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
      final token = await fetchSecureCacheStorage.fetchSecure('token');
      final authorizedHeaders = headers ?? {}..addAll({'x-access-token': token});
      return await decoratee.request(url: url, method: method, body: body, headers: authorizedHeaders);
    } on HttpError {
      rethrow;
    } catch(e) {
      throw HttpError.forbidden;
    }
  }
}