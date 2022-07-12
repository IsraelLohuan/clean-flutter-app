import 'package:ForDev/data/usecases/local_current_account/local_current_account.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/main/factories/cache/local_storage_adapter_factory.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
    fetchSecureCacheStorage: makeLocalStorageAdapter()
  );
}