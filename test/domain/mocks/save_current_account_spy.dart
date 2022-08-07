import 'package:forDev/domain/helpers/helpers.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

class SaveCurrentAccountSpy extends Mock implements SaveCurrentAccount {
  SaveCurrentAccountSpy() {
    this.mockSaveCurrentAccount();
  }

  When mockSaveCurrentAccountCall() => when(() => this.save(any()));
  void mockSaveCurrentAccount() => this.mockSaveCurrentAccountCall().thenAnswer((_) async => _);
  void mockSaveCurrentAccountError() => this.mockSaveCurrentAccountCall().thenThrow(DomainError.unexpected);
}