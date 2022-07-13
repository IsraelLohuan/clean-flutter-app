
import 'package:ForDev/presentation/protocol/protocols.dart';
import 'package:ForDev/validation/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if email is empty', () {
    expect(sut.validate(''), null);
  });

  test('Should return null if email is empty', () {
    expect(sut.validate(null), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate('srlohuan@gmail.com'), null);
  });

  test('Should return error if email is invalid', () {
    expect(sut.validate('srlohuangmail.com'), ValidationError.invalidField);
  });
}