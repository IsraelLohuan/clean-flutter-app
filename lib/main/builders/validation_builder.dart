
import 'package:ForDev/validation/protocols/protocols.dart';
import 'package:ForDev/validation/validators/email_validation.dart';
import 'package:ForDev/validation/validators/required_field_validation.dart';

class ValidationBuilder {
  ValidationBuilder._();

  static ValidationBuilder _instance;
  String fieldname;
  List<FieldValidation> validations = [];

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._();
    _instance.fieldname = fieldName;
    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldname));
    return this;
  }

   ValidationBuilder email() {
    validations.add(EmailValidation(fieldname));
    return this;
  }

  List<FieldValidation> build() => validations;
}