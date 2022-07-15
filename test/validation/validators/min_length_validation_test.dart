import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/validators/validators.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  MinLengthValidation sut;

  setUp(() {
    sut = MinLengthValidation(field: 'any_field', size: 5);  
  });

  test('Should return error if value is empty', () {
    expect(sut.validate({'any_field': ''}), ValidationError.invalidField);
  });

  test('Should return error if value is null', () {
    expect(sut.validate({'any_field': null}), ValidationError.invalidField);
  });

  test('Should return error if value is less than min size', () {
    final formData = {
      'any_field': faker.randomGenerator.string(4, min: 1)
    };

    expect(sut.validate(formData), ValidationError.invalidField);
  });

  test('Should return null if value is equal than min size', () {
    final formData = {
      'any_field': faker.randomGenerator.string(5, min: 5)
    };

    expect(sut.validate(formData), null);
  });

  test('Should return null if value is more than min size', () {
    final formData = {
      'any_field': faker.randomGenerator.string(10, min: 6)
    };

    expect(sut.validate(formData), null);
  });
}