
import 'package:forDev/presentation/protocol/protocols.dart';
import 'package:forDev/validation/protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  final String field;

  RequiredFieldValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    return input[field]?.isNotEmpty == true ? null : ValidationError.requiredField;
  }

  @override
  List get props => [field];
}