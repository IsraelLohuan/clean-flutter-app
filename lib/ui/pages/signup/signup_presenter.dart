import 'package:flutter/material.dart';
import 'package:forDev/ui/helpers/errors/errors.dart';

abstract class SignUpPresenter implements Listenable {
  Stream<UiError?> get nameErrorStream;
  Stream<UiError?> get emailErrorStream;
  Stream<UiError?> get passwordErrorStream;
  Stream<UiError?> get passwordConfirmationErrorStream;
  Stream<UiError?> get mainErrorStream;
  Stream<bool?>    get isFormValidStream;
  Stream<bool?>    get isLoadingStream;
  Stream<String?>  get navigateToStream;

  void validateName(String name);
  void validateEmail(String email);
  void validatePassword(String password);
  void validatePasswordConfirmation(String passwordConfirmation);
  Future<void> signUp();
  void goToSignUp();
}