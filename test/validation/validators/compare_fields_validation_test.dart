import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(field: 'any_field', valueToCompare: 'any_value');  
  });

  test('Should return error if value are not equal', () {
    expect(sut.validate('wrong_value'), ValidationError.invalidField);
  });

  test('Should return null if value are equal', () {
    expect(sut.validate('any_value'), null);
  });
}