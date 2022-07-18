
import 'package:ForDev/main/builders/builders.dart';
import 'package:ForDev/main/composites/composites.dart';
import 'package:ForDev/presentation/protocol/validation.dart';
import 'package:ForDev/validation/protocols/protocols.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().min(3).build()
  ];
}