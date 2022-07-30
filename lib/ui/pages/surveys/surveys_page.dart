import 'package:ForDev/ui/components/components.dart';
import 'package:ForDev/ui/components/spinner_dialog.dart';
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/surveys/components/components.dart';
import 'package:ForDev/ui/pages/surveys/surveys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ForDev/ui/mixins/mixins.dart';

class SurveysPage extends StatelessWidget with LoadingManager, NavigationManager, SessionManager {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.strings.surveys),
        centerTitle: true,
      ),
      body: Builder( 
        builder: (context) {
          handleLoading(context, presenter.isLoadingStream);
          handleNavigation(presenter.navigateToStream);
          handleSessionExpired(presenter.isSessionExpiredStream);

          presenter.loadData();

          return StreamBuilder<List<SurveyViewModel>>(
            stream: presenter.surveysStream,
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return ReloadScreen(
                  error: snapshot.error, 
                  reload: presenter.loadData,
                );
              }

              if(snapshot.hasData) {
                return Provider(
                  create: (_) => presenter,
                  child: SurveyItems(snapshot.data)
                );
              }

              return SizedBox(
                height: 0,
              );
            }
          );
        },
      )
    );
  }
}




