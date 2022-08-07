import 'dart:async';
import 'package:forDev/ui/helpers/errors/errors.dart';
import 'package:mocktail/mocktail.dart';
import 'package:forDev/ui/pages/pages.dart';

class SignUpPresenterSpy extends Mock implements SignUpPresenter {
  final nameErrorController = StreamController<UiError?>();
  final passwordConfirmationErrorController = StreamController<UiError?>();
  final emailErrorController = StreamController<UiError?>();
  final passwordErrorController = StreamController<UiError?>();
  final mainErrorController = StreamController<UiError?>();
  final navigateToController = StreamController<String?>();
  final isFormValidController = StreamController<bool>();
  final isLoadingController = StreamController<bool>(); 

  SignUpPresenterSpy() {
    when(() => this.signUp()).thenAnswer((_) async => _); 
    when(() => this.nameErrorStream).thenAnswer((_) => nameErrorController.stream);
    when(() => this.passwordConfirmationErrorStream).thenAnswer((_) => passwordConfirmationErrorController.stream);
    when(() => this.emailErrorStream).thenAnswer((_) => emailErrorController.stream);
    when(() => this.passwordErrorStream).thenAnswer((_) => passwordErrorController.stream);
    when(() => this.mainErrorStream).thenAnswer((_) => mainErrorController.stream);
    when(() => this.navigateToStream).thenAnswer((_) => navigateToController.stream);
    when(() => this.isFormValidStream).thenAnswer((_) => isFormValidController.stream);
    when(() => this.isLoadingStream).thenAnswer((_) => isLoadingController.stream);
  }

  void emitNameError(UiError error) => nameErrorController.add(error);
  void emitNameValid() => nameErrorController.add(null);
  void emitEmailError(UiError error) => emailErrorController.add(error);
  void emitEmailValid() => emailErrorController.add(null);
  void emitPasswordError(UiError error) => passwordErrorController.add(error);
  void emitPasswordValid() => passwordErrorController.add(null);
  void emitFormError() => isFormValidController.add(false);
  void emitFormValid() => isFormValidController.add(true);
  void emitLoading([bool show = true]) => isLoadingController.add(show);
  void emitMainError(UiError error) => mainErrorController.add(error);
  void emitNavigateTo(String route) => navigateToController.add(route);
  void emitPasswordConfirmationError(UiError error) => passwordConfirmationErrorController.add(error);
  void emitPasswordConfirmationValid() => passwordConfirmationErrorController.add(null);

  void dispose() {
    nameErrorController.close();
    passwordConfirmationErrorController.close();
    emailErrorController.close();
    passwordErrorController.close();
    mainErrorController.close();
    isFormValidController.close();
    isLoadingController.close();
    navigateToController.close();
  }
}
