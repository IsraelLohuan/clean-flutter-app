import 'package:ForDev/presentation/protocol/protocols.dart';

abstract class FieldValidation {
  String get field;
  ValidationError validate(Map input);
}