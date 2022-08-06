
import 'package:forDev/validation/protocols/protocols.dart';
import 'package:forDev/validation/validators/email_validation.dart';
import 'package:forDev/validation/validators/required_field_validation.dart';
import 'package:forDev/validation/validators/validators.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  String fieldname;
  List<FieldValidation> validations = [];

  ValidationBuilder._(this.fieldname);

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance!;
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