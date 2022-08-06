import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/presentation/mixins/mixins.dart';
import 'package:forDev/ui/pages/splash/splash.dart';
import 'package:get/get.dart';

class GetxSplashPresenter extends GetxController with NavigationManager implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  GetxSplashPresenter({required this.loadCurrentAccount});

  @override
  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      await loadCurrentAccount.load();
      navigateTo = '/surveys';
    } catch(e) {
      navigateTo = '/login';
    }
  }
}