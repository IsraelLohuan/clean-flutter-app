
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);

    return StreamBuilder<UiError>(
      stream: presenter.emailErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.strings.email,
            icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight,),  
            errorText: snapshot.hasData ? snapshot.data.description : null
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validateEmail,
        );
      }
    );
  }
}