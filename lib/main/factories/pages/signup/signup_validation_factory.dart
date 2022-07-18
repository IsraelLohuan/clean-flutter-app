
import 'package:ForDev/main/builders/builders.dart';
import 'package:ForDev/main/composites/composites.dart';
import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/protocols/protocols.dart';

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