
import 'package:forDev/main/builders/builders.dart';
import 'package:forDev/main/composites/composites.dart';
import 'package:forDev/presentation/protocol/validation.dart';
import 'package:forDev/validation/protocols/protocols.dart';

Validation makeSignUpValidation() {
  return ValidationComposite(makeSignUpValidations());
}

List<FieldValidation> makeSignUpValidations() {
  return [
    ...ValidationBuilder.field('name').required().min(3).build(),
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().min(3).build(),
    ...ValidationBuilder.field('passwordConfirmation').required().sameAs('password').build()
  ];
}