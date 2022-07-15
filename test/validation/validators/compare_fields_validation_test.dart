import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(field: 'any_field', fieldToCompare: 'any_value');  
  });

  test('Should return error if value are not equal', () {
    final formData = {
      'any_field': 'any_value',
      'any_value': 'other_value'
    };

    expect(sut.validate(formData), ValidationError.invalidField);
  });

  test('Should return null if value are equal', () {
    final formData = {
      'any_field': 'any_value',
      'any_value': 'any_value'
    };

    expect(sut.validate(formData), null);
  });
}