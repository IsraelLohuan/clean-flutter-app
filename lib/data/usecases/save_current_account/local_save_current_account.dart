import 'package:ForDev/data/cache/cache.dart';
import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveCacheStorage;

  LocalSaveCurrentAccount({@required this.saveCacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
      await saveCacheStorage.save(key: 'token', value: account.token);
    } catch(error) {
      throw DomainError.unexpected;
    }
  } 
}