import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/presentation/mixins/mixins.dart';
import 'package:ForDev/ui/pages/splash/splash.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter with NavigationManager implements SplashPresenter {
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