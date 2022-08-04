
import 'package:forDev/data/usecases/usecases.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/main/factories/cache/secure_storage_adapter_factory.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
    saveCacheStorage: makeSecureStorageAdapter()
  );
}