
import 'package:ForDev/main/factories/factories.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';

Widget makeSignUpPage() {
  return SignUpPage(makeGetXSignUpPresenter());
}