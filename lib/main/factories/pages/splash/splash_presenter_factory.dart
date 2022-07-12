
import 'package:ForDev/main/factories/factories.dart';
import 'package:ForDev/presentation/presenters/presenters.dart';
import 'package:ForDev/ui/pages/splash/splash.dart';

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(
    loadCurrentAccount: makeLocalLoadCurrentAccount()
  );
}