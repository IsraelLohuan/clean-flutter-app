import 'dart:async';
import 'package:mocktail/mocktail.dart';
import 'package:forDev/ui/pages/pages.dart';

class SurveysPresenterSpy extends Mock implements SurveysPresenter {
  final isSessionExpiredController = StreamController<bool>();
  final isLoadingController = StreamController<bool>(); 
  final navigateToController = StreamController<String?>();
  final surveysController = StreamController<List<SurveyViewModel>>();

  SurveysPresenterSpy() {
    when(() => this.loadData()).thenAnswer((_) async => _);
    when(() => this.navigateToStream).thenAnswer((_) => navigateToController.stream);
    when(() => this.isSessionExpiredStream).thenAnswer((_) => isSessionExpiredController.stream);
    when(() => this.isLoadingStream).thenAnswer((_) => isLoadingController.stream);
    when(() => this.surveysStream).thenAnswer((invocation) => surveysController.stream);
  }

  void emitSurveys(List<SurveyViewModel> data) => surveysController.add(data);
  void emitSurveysError(String error) => surveysController.addError(error);
  void emitLoading([bool show = true]) => isLoadingController.add(show);
  void emitSessionExpired([bool show = true]) => isSessionExpiredController.add(show);
  void emitNavigateTo(String route) => navigateToController.add(route);

  void dispose() {
    isLoadingController.close();
    isSessionExpiredController.close();
    isLoadingController.close();
    navigateToController.close();
  }
}
