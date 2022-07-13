import 'package:ForDev/utils/i18n/strings/pt_br.dart';
import 'strings/strings.dart';
import 'package:flutter/widgets.dart';

class R {
  static Translations strings = PtBr();

  static void load(Locale locale) {
    switch(locale.toString()) {
      case 'en_US': strings = EnUs(); break;
      default: strings = PtBr(); break;
    }
  }
}