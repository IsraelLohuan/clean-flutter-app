
import 'package:forDev/main/factories/factories.dart';
import 'package:forDev/presentation/presenters/presenters.dart';
import 'package:forDev/ui/pages/pages.dart';

LoginPresenter makeGetXLoginPresenter() {
  return GetxLoginPresenter(
    authentication: makeRemoteAuthentication(),
    validation: makeLoginValidation(),
    saveCurrentAccount: makeLocalSaveCurrentAccount()
  );
}