
import 'package:forDev/main/builders/builders.dart';
import 'package:forDev/main/composites/composites.dart';
import 'package:forDev/presentation/protocol/validation.dart';
import 'package:forDev/validation/protocols/protocols.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().min(3).build()
  ];
}