import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:get/get.dart';

mixin UiErrorManager on GetxController {
  final _mainError = Rx<UiError>();
  Stream<UiError> get mainErrorStream => _mainError.stream;
  set mainError(UiError value) => _mainError.value = value;
}