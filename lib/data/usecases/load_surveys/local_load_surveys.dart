import 'package:ForDev/data/cache/cache.dart';
import 'package:ForDev/data/models/models.dart';
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:meta/meta.dart';

class LocalLoadSurveys {
  final FetchCacheStorage fetchCacheStorage;

  LocalLoadSurveys({@required this.fetchCacheStorage});

  Future<List<SurveyEntity>> load() async {
    try {
      final data = await fetchCacheStorage.fetch('surveys');
      if(data?.isEmpty != false) {
        throw Exception();
      }
      return data.map<SurveyEntity>((json) => LocalSurveyModel.fromJson(json).toEntity()).toList();
    } catch(e) {
      throw DomainError.unexpected;
    }
  }
}