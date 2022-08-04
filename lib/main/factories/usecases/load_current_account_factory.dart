import 'package:forDev/data/usecases/local_current_account/local_current_account.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/main/factories/cache/secure_storage_adapter_factory.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
    fetchCacheStorage: makeSecureStorageAdapter()
  );
}