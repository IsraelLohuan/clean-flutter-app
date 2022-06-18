
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:ForDev/domain/usecases/usecases.dart';

import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/data/http/http_client.dart';

class HttpClientSpy extends Mock implements HttpClient {}

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