
import 'package:ForDev/main/factories/factories.dart';
import 'package:ForDev/presentation/presenters/presenters.dart';
import 'package:ForDev/ui/pages/pages.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
    authentication: makeRemoteAuthentication(),
    validation: makeLoginValidation()
  );
}