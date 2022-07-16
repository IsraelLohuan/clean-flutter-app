import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/data/models/models.dart';
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class RemoteLoadSurveys implements LoadSurveys {
  final String url;
  final HttpClient<List<Map>> httpClient;

  RemoteLoadSurveys({
    @required this.httpClient,
    @required this.url
  });

  Future<List<SurveyEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<SurveyEntity>((json) => RemoteSurveyModel.fromJson(json).toEntity()).toList();
    } on HttpError catch(error){
      throw error == HttpError.forbidden
        ? DomainError.accessDenied
        : DomainError.unexpected;
    }
  }
}