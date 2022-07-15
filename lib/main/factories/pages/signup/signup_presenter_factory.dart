
import 'package:ForDev/main/factories/pages/pages.dart';
import 'package:ForDev/main/factories/usecases/usecases.dart';
import 'package:ForDev/presentation/presenters/presenters.dart';
import 'package:ForDev/ui/pages/signup/signup.dart';

SignUpPresenter makeGetXSignUpPresenter() {
  return GetxSignUpPresenter(
    addAccount: makeRemoteAddAccount(), 
    validation: makeSignUpValidation(), 
    saveCurrentAccount: makeLocalSaveCurrentAccount()
  );
}