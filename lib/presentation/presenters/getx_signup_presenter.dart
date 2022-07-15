import 'dart:async';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:ForDev/presentation/protocol/protocols.dart';

class GetxSignUpPresenter extends GetxController {
  final Validation validation;
 
  var _nameError = Rx<UiError>();
  var _emailError = Rx<UiError>();
  var _isFormValid = false.obs;
  
  Stream<UiError> get nameErrorStream  => _nameError.stream;
  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<bool>    get isFormValidStream => _isFormValid.stream;
 
  GetxSignUpPresenter({
    @required this.validation, 
  });

  void validateEmail(String email) {
    _emailError.value = _validateField(field: 'email', value: email);  
    _validateForm();
  }

  void validateName(String name) {
    _nameError.value = _validateField(field: 'name', value: name);
    _validateForm();
  }

  UiError _validateField({String field, String value}) {
    final error = validation.validate(field: field, value: value);
    switch(error) {
      case ValidationError.invalidField: return UiError.invalidField;
      case ValidationError.requiredField: return UiError.requiredField;
      default: return null;
    }
  }

  void _validateForm() {
   _isFormValid.value = false;
  }

  void dispose() {}
}