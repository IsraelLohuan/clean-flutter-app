
import 'package:ForDev/main/factories/factories.dart';
import 'package:ForDev/presentation/presenters/getx_survey_result_presenter.dart';
import 'package:ForDev/ui/pages/pages.dart';

SurveyResultPresenter makeGetxSurveyResultPresenter(String surveyId) =>  GetxSurveyResultPresenter(
  loadSurveyResult: makeRemoteLoadSurveyResult(surveyId), 
  surveyId: surveyId
);