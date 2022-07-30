import 'package:ForDev/data/http/http.dart';
import 'package:meta/meta.dart';

class RemoteSaveSurveyResult {
  final String url;
  final HttpClient httpClient;

  RemoteSaveSurveyResult({
    @required this.httpClient,
    @required this.url
  });

  Future<void> save({String answer}) async {
    await httpClient.request(url: url, method: 'put', body: {'answer': answer});
  }
}