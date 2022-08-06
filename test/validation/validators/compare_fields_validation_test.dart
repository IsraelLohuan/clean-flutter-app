import 'package:forDev/presentation/protocol/validation.dart';
import 'package:forDev/validation/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(field: 'any_field', fieldToCompare: 'any_value');  
  });

  test('Should return null on invalid cases', () {
    expect(sut.validate({'any_field': 'any_value'}), null);
    expect(sut.validate({'other_field': 'any_value'}), null);
    expect(sut.validate({}), null);
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