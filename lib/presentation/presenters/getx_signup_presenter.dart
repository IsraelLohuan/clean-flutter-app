import 'dart:async';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:ForDev/presentation/protocol/protocols.dart';

class GetxSignUpPresenter extends GetxController {
  final AddAccount addAccount;
  final Validation validation;
 
  final _nameError = Rx<UiError>();
  final _emailError = Rx<UiError>();
  final _passwordError = Rx<UiError>();
  final _passwordConfirmationError = Rx<UiError>();
  final _isFormValid = false.obs;
  
  String _name;
  String _email;
  String _password;
  String _passwordConfirmation;

  Stream<UiError> get nameErrorStream  => _nameError.stream;
  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<UiError> get passwordErrorStream => _passwordError.stream;
  Stream<UiError> get passwordConfirmationErrorStream =>_passwordConfirmationError.stream;
  Stream<bool>    get isFormValidStream => _isFormValid.stream;
 
  GetxSignUpPresenter({
    @required this.validation, 
    @required this.addAccount
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField(field: 'email', value: email);  
    _validateForm();
  }

  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField(field: 'name', value: name);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField(field: 'password', value: password);
    _validateForm();
  }

  void validatePasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    _passwordConfirmationError.value = _validateField(field: 'passwordConfirmation', value: passwordConfirmation);
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
    _isFormValid.value = _emailError.value == null  
    && _nameError.value == null  
    && _passwordError.value == null  
    && _passwordConfirmationError.value == null  
    && _email != null
    && _name != null
    && _password != null
    && _passwordConfirmation != null;
  }

  Future<void> signUp() async {
    await addAccount.add(AddAccountParams(
      name: _name,
      email: _email,
      password: _password,
      passwordConfirmation: _passwordConfirmation
    ));
  }
}