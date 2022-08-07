
import 'package:forDev/domain/entities/account_entity.dart';
import 'package:forDev/domain/helpers/helpers.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

class AddAccountSpy extends Mock implements AddAccount {
  When mockAddAccountCall() => when(() => this.add(any()));
  void mockAddAccount(AccountEntity data) => mockAddAccountCall().thenAnswer((_) async => data);
  void mockAddAccountError(DomainError error) => mockAddAccountCall().thenThrow(error);
}