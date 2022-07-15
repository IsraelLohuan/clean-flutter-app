
import 'package:ForDev/validation/protocols/protocols.dart';
import 'package:ForDev/validation/validators/email_validation.dart';
import 'package:ForDev/validation/validators/required_field_validation.dart';
import 'package:ForDev/validation/validators/validators.dart';

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

  ValidationBuilder min(int size) {
    validations.add(MinLengthValidation(field: fieldname, size: size));
    return this;
  }

  ValidationBuilder sameAs(String fieldToCompare) {
    validations.add(CompareFieldsValidation(field: fieldname, fieldToCompare: fieldToCompare));
    return this;
  }

  List<FieldValidation> build() => validations;
}