import 'package:ForDev/presentation/protocol/protocols.dart';
import 'package:ForDev/validation/protocols/protocols.dart';
import 'package:meta/meta.dart';

class CompareFieldsValidation implements FieldValidation {
  final String field;
  final String fieldToCompare;

  CompareFieldsValidation({@required this.field, @required this.fieldToCompare});

  @override
  ValidationError validate(Map input) =>
    input[field] != null &&
      input[fieldToCompare] != null &&
      input[field] != input[fieldToCompare] ? ValidationError.invalidField : null;
}