
import 'package:ForDev/ui/components/components.dart';
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'components/components.dart';

class SurveyResultPage extends StatelessWidget {
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
          presenter.isLoadingStream.listen((isLoading) {
            if(isLoading == true) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          presenter.loadData();

          return StreamBuilder<dynamic>(
            stream: presenter.surveyResultStream,
            builder: (context, snapshot) {  
              if(snapshot.hasError) {
                return ReloadScreen(error: snapshot.error, reload: presenter.loadData);
              }

              if(snapshot.hasData) {
                return SurveyResult();
              }

              return SizedBox(height: 0,);
            }
          );
        } 
      ),
    );
  }
}



