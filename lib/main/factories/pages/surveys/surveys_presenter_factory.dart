import 'package:ForDev/presentation/presenters/presenters.dart';
import 'package:ForDev/ui/pages/surveys/surveys.dart';
import '../../factories.dart';

SurveysPresenter makeGetxSurveysPresenter() => GetxSurveysPresenter(loadSurveys: makeRemoteLoadSurveysWithLocalFallback());
    
 
  