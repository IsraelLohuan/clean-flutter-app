
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.password,
        icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight,),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
