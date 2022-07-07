
import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/protocols/protocols.dart';
import 'package:ForDev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password')
  ];
}