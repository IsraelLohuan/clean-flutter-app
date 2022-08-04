
import 'package:forDev/main/factories/pages/pages.dart';
import 'package:forDev/main/factories/usecases/usecases.dart';
import 'package:forDev/presentation/presenters/presenters.dart';
import 'package:forDev/ui/pages/signup/signup.dart';

SignUpPresenter makeGetXSignUpPresenter() {
  return GetxSignUpPresenter(
    addAccount: makeRemoteAddAccount(), 
    validation: makeSignUpValidation(), 
    saveCurrentAccount: makeLocalSaveCurrentAccount()
  );
}