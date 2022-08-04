
import 'package:forDev/main/factories/factories.dart';
import 'package:forDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';

Widget makeLoginPage() {
  return LoginPage(makeGetXLoginPresenter());
}