import 'package:flutter/material.dart';
import 'package:forDev/ui/helpers/errors/errors.dart';

abstract class LoginPresenter extends Listenable {
  Stream<UiError?> get emailErrorStream;
  Stream<UiError?> get passwordErrorStream;
  Stream<UiError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool?> get isFormValidStream;
  Stream<bool?> get isLoadingStream;
  
  void validateEmail(String email);
  void validatePassword(String password);
  Future<void> auth();
  void goToSignUp();
}