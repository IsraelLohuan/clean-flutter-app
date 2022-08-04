
import 'package:forDev/main/factories/factories.dart';
import 'package:forDev/presentation/presenters/getx_survey_result_presenter.dart';
import 'package:forDev/ui/pages/pages.dart';

SurveyResultPresenter makeGetxSurveyResultPresenter(String surveyId) =>  GetxSurveyResultPresenter(
  loadSurveyResult: makeRemoteLoadSurveyResultWithLocalFallback(surveyId), 
  saveSurveyResult: makeRemoteSaveSurveyResult(surveyId),
  surveyId: surveyId, 
);