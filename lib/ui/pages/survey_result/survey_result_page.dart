
import 'package:ForDev/ui/components/components.dart';
import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:flutter/material.dart';

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

          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              if(index == 0) {
                return Container(
                  padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor.withAlpha(90)
                  ),
                  child: Text('Qual é o seu framework web favorito?')
                );
              }

              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          'http://fordevs.herokuapp.com/static/img/logo-angular.png',
                          width: 40,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Angular',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Text(
                          '100%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.check_circle,
                            color: Theme.of(context).highlightColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1,)
                ],
              );
            },
          );
        } 
      ),
    );
  }
}

