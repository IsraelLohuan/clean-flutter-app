import 'package:ForDev/ui/components/components.dart';
import 'package:ForDev/ui/components/spinner_dialog.dart';
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/surveys/components/components.dart';
import 'package:ForDev/ui/pages/surveys/surveys.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SurveysPage extends StatelessWidget {
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

          presenter.isLoadingStream.listen((isLoading) {
            if(isLoading == true) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      aspectRatio: 1,
                    ),
                    items: snapshot.data.map((viewModel) => SurveyItem(viewModel)).toList(),
                  ),
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


