import 'package:forDev/data/cache/cache.dart';
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/helpers/helpers.dart';
import 'package:forDev/domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveCacheStorage;

  LocalSaveCurrentAccount({required this.saveCacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
      await saveCacheStorage.save(key: 'token', value: account.token);
    } catch(error) {
      throw DomainError.unexpected;
    }
  } 
}