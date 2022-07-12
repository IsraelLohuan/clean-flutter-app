import 'dart:async';
import 'package:ForDev/domain/helpers/domain_error.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:ForDev/presentation/protocol/protocols.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;
  final SaveCurrentAccount saveCurrentAccount;

  String _email;
  String _password;

  var _emailError = RxString();
  var _passwordError = RxString();
  var _mainError = RxString();
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get emailErrorStream => _emailError.stream;
  Stream<String> get passwordErrorStream => _passwordError.stream;
  Stream<String> get mainErrorStream => _mainError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxLoginPresenter({
    @required this.validation, 
    @required this.authentication, 
    @required this.saveCurrentAccount
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: 'email', value: email);  
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = validation.validate(field: 'password', value: password);
    _validateForm();
  }

  void _validateForm() {
   _isFormValid.value = _emailError.value == null
    && _passwordError.value == null
    && _email != null
    && _password != null;
  }

  Future<void> auth() async {
    _isLoading.value = true;
    try {
      final account = await authentication.auth(AuthenticationParams(email: _email, secret: _password));
      await saveCurrentAccount.save(account);
    } on DomainError catch(error) {
      _mainError.value = error.description;
    }
    _isLoading.value = false;
  }

  void dispose() {}
}