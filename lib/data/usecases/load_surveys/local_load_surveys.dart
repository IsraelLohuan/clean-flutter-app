import 'package:ForDev/data/cache/cache.dart';
import 'package:ForDev/data/models/models.dart';
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class LocalLoadSurveys implements LoadSurveys {
  final CacheStorage cacheStorage;

  LocalLoadSurveys({@required this.cacheStorage});

  Future<List<SurveyEntity>> load() async {
    try {
      final data = await cacheStorage.fetch('surveys');
      if(data?.isEmpty != false) {
        throw Exception();
      }
      return _mapToEntity(data);
    } catch(error) {
      throw DomainError.unexpected;
    }
  }

  Future<void> validate() async {
    try {
      final data = await cacheStorage.fetch('surveys');
      _mapToEntity(data);
    } catch(error) {
      await cacheStorage.delete('surveys');
    }
  }

  Future<void> save(List<SurveyEntity> surveys) async {
    await cacheStorage.save(key: 'surveys', value: _mapToJson(surveys));
  }

  List<SurveyEntity> _mapToEntity(List<Map> list) => list.map<SurveyEntity>((json) => LocalSurveyModel.fromJson(json).toEntity()).toList();
  List<Map> _mapToJson(List<SurveyEntity> list) => list.map((entity) => LocalSurveyModel.fromEntity(entity).toJson()).toList();
}