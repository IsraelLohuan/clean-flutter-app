
import 'dart:io';
import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/data/usecases/save_survey_result/save_survey_result.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteSaveSurveyResult sut;
  String url;
  HttpClientSpy httpClient;
  String answer;

  setUp(() {
    answer = faker.lorem.sentence();
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = RemoteSaveSurveyResult(url: url, httpClient: httpClient);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.save(answer: answer);
    verify(httpClient.request(url: url, method: 'put', body: {'answer': answer}));
  });
}