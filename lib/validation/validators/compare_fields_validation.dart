import 'package:forDev/presentation/protocol/protocols.dart';
import 'package:forDev/validation/protocols/protocols.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CompareFieldsValidation  extends Equatable implements FieldValidation {
  final String field;
  final String fieldToCompare;

  CompareFieldsValidation({@required this.field, @required this.fieldToCompare});

  @override
  ValidationError validate(Map input) =>
    input[field] != null &&
      input[fieldToCompare] != null &&
      input[field] != input[fieldToCompare] ? ValidationError.invalidField : null;

  @override
  List get props => [field, fieldToCompare];
}