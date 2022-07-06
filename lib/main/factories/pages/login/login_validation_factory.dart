
import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password')
  ]);
}