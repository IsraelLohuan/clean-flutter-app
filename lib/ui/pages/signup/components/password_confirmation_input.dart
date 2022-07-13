
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:flutter/material.dart';

class PasswordConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.confirmPassword,
        icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight,),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
