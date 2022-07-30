import 'package:ForDev/data/cache/cache.dart';
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
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