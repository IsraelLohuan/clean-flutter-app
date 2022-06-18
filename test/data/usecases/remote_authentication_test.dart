
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:ForDev/domain/usecases/authentication.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url
  });

  Future<void> auth(AuthenticationParams params) async {
    final body = {'email': params.email, 'password': params.secret};

    httpClient.request(url: url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void> request({
    @required String url,
    @required String method,
    Map body
  });
}

class HttpClientSpy extends Mock implements HttpClient {

}

void main() {

  RemoteAuthentication sut;
  HttpClientSpy httpClientSpy;
  String url;

  setUp(() {
    httpClientSpy = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClientSpy, url: url);
  });

  test('Should call HttpClient with correct values', () async {

    final params = AuthenticationParams(email: faker.internet.email(), secret: faker.internet.password());

    await sut.auth(params);

    verify(httpClientSpy.request(
      url: url,
      method: 'post',
      body: {'email': params.email, 'password': params.secret}
    ));
  });
}