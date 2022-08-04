import 'package:forDev/data/cache/cache.dart';
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/helpers.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  FetchSecureCacheStorage fetchCacheStorage;

  LocalLoadCurrentAccount({@required this.fetchCacheStorage});

  Future<AccountEntity> load() async {
    try {
      final token = await fetchCacheStorage.fetch('token');
      return AccountEntity(token);
    } catch(error) {
      throw DomainError.unexpected;
    }
  }
}