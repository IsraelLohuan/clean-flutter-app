import 'package:forDev/domain/usecases/usecases.dart';
import 'package:forDev/presentation/mixins/mixins.dart';
import 'package:forDev/ui/pages/splash/splash.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter extends GetxController with NavigationManager implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  @override
  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final account = await loadCurrentAccount.load();
      navigateTo = account?.token == null ? '/login' : '/surveys';
    } catch(e) {
      navigateTo = '/login';
    }
  }
}