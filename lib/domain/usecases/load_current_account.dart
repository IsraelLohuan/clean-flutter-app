
import 'package:ForDev/domain/entities/entities.dart';

abstract class LoadCurrentAccount {
  Future<AccountEntity> load();
}