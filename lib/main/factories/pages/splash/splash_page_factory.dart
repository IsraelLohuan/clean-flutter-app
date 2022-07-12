
import 'package:ForDev/main/factories/pages/splash/splash.dart';
import 'package:ForDev/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';

Widget makeSplashPage() {
  return SplashPage(presenter: makeGetxSplashPresenter(),);
}