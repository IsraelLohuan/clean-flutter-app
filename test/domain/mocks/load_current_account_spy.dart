
import 'package:forDev/domain/entities/entities.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {
  When mockLoadCurrentAccountCall() => when(() => this.load());
  void mockLoadCurrentAccount({required AccountEntity account}) => this.mockLoadCurrentAccountCall().thenAnswer((_) async => account);
  void mockLoadCurrentAccountError() => this.mockLoadCurrentAccountCall().thenThrow(Exception());
}
