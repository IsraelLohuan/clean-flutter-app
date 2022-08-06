
import 'package:forDev/presentation/protocol/protocols.dart';
import 'package:forDev/validation/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null on invalid case', () {
    expect(sut.validate({}), null);
  });

  test('Should return null if email is empty', () {
    expect(sut.validate({'any_field': ''}), null);
  });

  test('Should return null if email is empty', () {
    expect(sut.validate({'any_field': null}), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate({'any_field': 'srlohuan@gmail.com'}), null);
  });

  test('Should return error if email is invalid', () {
    expect(sut.validate({'any_field': 'srlohuangmailcom'}), ValidationError.invalidField);
  });
}