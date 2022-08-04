import 'dart:async';
import 'package:forDev/domain/helpers/domain_error.dart';
import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/presentation/mixins/mixins.dart';
import 'package:forDev/ui/helpers/errors/errors.dart';
import 'package:forDev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:forDev/presentation/protocol/protocols.dart';

class GetxSignUpPresenter extends GetxController with FormManager, NavigationManager, UiErrorManager, LoadingManager implements SignUpPresenter {
  final AddAccount addAccount;
  final Validation validation;
  final SaveCurrentAccount saveCurrentAccount;

  final _nameError = Rx<UiError>();
  final _emailError = Rx<UiError>();
  final _passwordError = Rx<UiError>();
  final _passwordConfirmationError = Rx<UiError>();
 
  String _name;
  String _email;
  String _password;
  String _passwordConfirmation;

  Stream<UiError> get nameErrorStream  => _nameError.stream;
  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<UiError> get passwordErrorStream => _passwordError.stream;
  Stream<UiError> get passwordConfirmationErrorStream =>_passwordConfirmationError.stream;
 
  GetxSignUpPresenter({
    @required this.validation, 
    @required this.addAccount,
    @required this.saveCurrentAccount
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField(field: 'email');  
    _validateForm();
  }

  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField(field: 'name');
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField(field: 'password');
    _validateForm();
  }

  void validatePasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    _passwordConfirmationError.value = _validateField(field: 'passwordConfirmation');
    _validateForm();
  }

  UiError _validateField({String field}) {
    final formData = {
      'name': _name,
      'email': _email,
      'password': _password,
      'passwordConfirmation': _passwordConfirmation
    };
    final error = validation.validate(field: field, input: formData);
    switch(error) {
      case ValidationError.invalidField: return UiError.invalidField;
      case ValidationError.requiredField: return UiError.requiredField;
      default: return null;
    }
  }

  void _validateForm() {
    isFormValid = _emailError.value == null  
    && _nameError.value == null  
    && _passwordError.value == null  
    && _passwordConfirmationError.value == null  
    && _email != null
    && _name != null
    && _password != null
    && _passwordConfirmation != null;
  }

  Future<void> signUp() async {
    try {
      mainError = null;
      isLoading = true;
      final account = await addAccount.add(AddAccountParams(
        name: _name,
        email: _email,
        password: _password,
        passwordConfirmation: _passwordConfirmation
      ));
      await saveCurrentAccount.save(account);
      navigateTo = '/surveys';
    } on DomainError catch(error) {
      switch(error) {
        case DomainError.emailInUse: mainError = UiError.emailInUse; break;
        default: mainError = UiError.unexpected; break;
      }
      isLoading = false;
    }
  }

  @override
  void goToSignUp() {
    navigateTo = '/login';
  }
}