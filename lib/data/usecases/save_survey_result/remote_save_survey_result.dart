import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/domain/helpers/domain_error.dart';
import 'package:meta/meta.dart';

class RemoteSaveSurveyResult {
  final String url;
  final HttpClient httpClient;

  RemoteSaveSurveyResult({
    @required this.httpClient,
    @required this.url
  });

  Future<void> save({String answer}) async {
    try {
      await httpClient.request(url: url, method: 'put', body: {'answer': answer});
    } on HttpError catch(error) {
      throw error == HttpError.forbidden
        ? DomainError.accessDenied
        : DomainError.unexpected;
    }
  }
}