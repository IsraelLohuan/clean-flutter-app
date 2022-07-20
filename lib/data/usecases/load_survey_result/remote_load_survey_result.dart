import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/data/models/models.dart';
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class RemoteLoadSurveyResult implements LoadSurveyResult {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSurveyResult({
    @required this.httpClient,
    @required this.url
  });

  Future<SurveyResultEntity> loadBySurvey({String surveyId}) async {
    try {
      final json = await httpClient.request(url: url, method: 'get');
      return RemoteSurveyResultModel.fromJson(json).toEntity();
    } on HttpError catch(error){
      throw error == HttpError.forbidden
        ? DomainError.accessDenied
        : DomainError.unexpected;
    }
  }
}