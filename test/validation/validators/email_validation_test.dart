import 'package:ForDev/validation/protocols/protocols.dart';
import 'package:flutter_test/flutter_test.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  @override
  String validate(String value) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value);
    return isValid ? null : 'Campo inválido';
  }  
}

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
    expect(sut.validate('srlohuangmail.com'), 'Campo inválido');
  });
}