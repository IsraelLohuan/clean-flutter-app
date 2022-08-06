import 'package:forDev/ui/helpers/errors/errors.dart';
import 'package:forDev/ui/pages/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<UiError?>(
      stream: presenter.passwordErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Senha',
            icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight,),
            errorText: snapshot.data?.description
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validatePassword,
        );
      }
    );
  }
}
