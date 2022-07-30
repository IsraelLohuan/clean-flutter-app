
import 'package:ForDev/ui/components/components.dart';
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'components/components.dart';
import 'package:ForDev/ui/mixins/mixins.dart';

class SurveyResultPage extends StatelessWidget with LoadingManager, SessionManager {
  final SurveyResultPresenter presenter;

  SurveyResultPage(this.presenter);

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
          handleSessionExpired(presenter.isSessionExpiredStream);

          presenter.loadData();

          return StreamBuilder<SurveyResultViewModel>(
            stream: presenter.surveyResultStream,
            builder: (context, snapshot) {  
              if(snapshot.hasError) {
                return ReloadScreen(error: snapshot.error, reload: presenter.loadData);
              }

              if(snapshot.hasData) {
                return SurveyResult(snapshot.data);
              }

              return SizedBox(height: 0,);
            }
          );
        } 
      ),
    );
  }
}



