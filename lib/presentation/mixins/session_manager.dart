import 'package:get/get.dart';

mixin SessionManager {
  var _isSessionExpired = false.obs;
  Stream<bool> get isSessionExpiredStream => _isSessionExpired.stream;
  set isSessionExpired(bool value) => _isSessionExpired.value = value;
}