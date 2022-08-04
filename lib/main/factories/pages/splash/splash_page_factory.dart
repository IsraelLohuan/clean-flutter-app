
import 'package:forDev/main/factories/pages/splash/splash.dart';
import 'package:forDev/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';

Widget makeSplashPage() {
  return SplashPage(presenter: makeGetxSplashPresenter(),);
}