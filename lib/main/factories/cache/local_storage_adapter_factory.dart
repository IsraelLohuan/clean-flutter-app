
import 'package:ForDev/infra/cache/cache.dart';
import 'package:localstorage/localstorage.dart';

LocalStorageAdapter makeLocalStorageAdapter() {
  return LocalStorageAdapter(localStorage: LocalStorage('fordev'));
}