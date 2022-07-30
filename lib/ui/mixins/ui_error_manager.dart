import 'package:ForDev/ui/components/components.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:flutter/cupertino.dart';

mixin UiErrorManager {
  void handleMainError(BuildContext context, Stream<UiError> stream) {
    stream.listen((error) {
      if(error != null) {
        showErrorMessage(context, error.description);
      }
    });       
  }
}