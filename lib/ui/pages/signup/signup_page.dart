import 'package:forDev/ui/components/components.dart';
import 'package:forDev/ui/helpers/helpers.dart';
import 'package:forDev/ui/helpers/i18n/i18n.dart';
import 'package:forDev/ui/mixins/mixins.dart';
import 'package:forDev/ui/pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

class SignUpPage extends StatelessWidget with KeyBoardManager, LoadingManager, UiErrorManager, NavigationManager {
  final SignUpPresenter presenter;

  SignUpPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          handleLoading(context, presenter.isLoadingStream); 
          handleMainError(context, presenter.mainErrorStream);
          handleNavigation(presenter.navigateToStream, clear: true);

          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginHeader(),
                  HeadLine1(text: R.strings.addAccount),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Provider(
                      create: (_) => presenter,
                      child: Form(
                        child: Column(
                          children: [
                            NameInput(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8,),
                              child: EmailInput(),
                            ),
                            PasswordInput(),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 32),
                              child: PasswordConfirmationInput(),
                            ),
                            SignUpButton(),
                            FlatButton.icon(
                              onPressed: presenter.goToSignUp, 
                              icon: Icon(Icons.exit_to_app), 
                              label: Text(R.strings.login)
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]
              )
            ),
          );
        },
      ),
    );
  }
}






