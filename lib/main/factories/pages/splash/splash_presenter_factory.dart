
import 'package:forDev/main/factories/factories.dart';
import 'package:forDev/presentation/presenters/presenters.dart';
import 'package:forDev/ui/pages/splash/splash.dart';

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(
    loadCurrentAccount: makeLocalLoadCurrentAccount()
  );
}