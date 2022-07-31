import 'package:get/get.dart';

mixin LoadingManager on GetxController {
  var _isLoading = false.obs;
  Stream<bool> get isLoadingStream => _isLoading.stream;
  set isLoading(bool value) => _isLoading.subject.add(value);
}