import 'package:forDev/presentation/protocol/protocols.dart';
import 'package:forDev/validation/protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  final String field;
  final int size;

  MinLengthValidation({required this.field, required this.size});

  @override
  ValidationError? validate(Map input) {
    return input[field] != null && input[field].length >= size ? null : ValidationError.invalidField;
  }

  @override
  List<Object> get props => [field, size]; 
}