import 'package:forDev/ui/components/components.dart';
import 'package:flutter/cupertino.dart';

mixin LoadingManager {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((isLoading) => isLoading == true ? showLoading(context) : hideLoading(context));       
  }
}