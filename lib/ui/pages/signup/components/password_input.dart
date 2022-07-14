
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);

    return StreamBuilder<UiError>(
      stream: presenter.passwordErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.strings.password,
            icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight,),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validatePassword,
        );
      }
    );
  }
}
