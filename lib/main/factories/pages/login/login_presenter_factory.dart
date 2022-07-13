
import 'package:ForDev/main/factories/factories.dart';
import 'package:ForDev/presentation/presenters/presenters.dart';
import 'package:ForDev/ui/pages/pages.dart';

LoginPresenter makeGetXLoginPresenter() {
  return GetxLoginPresenter(
    authentication: makeRemoteAuthentication(),
    validation: makeLoginValidation(),
    saveCurrentAccount: makeLocalSaveCurrentAccount()
  );
}