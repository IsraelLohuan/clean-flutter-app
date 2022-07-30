import 'package:flutter/material.dart';

mixin KeyBoardManager {
  void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    if(!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}