import 'package:forDev/presentation/presenters/presenters.dart';
import 'package:forDev/ui/pages/surveys/surveys.dart';
import '../../factories.dart';

SurveysPresenter makeGetxSurveysPresenter() => GetxSurveysPresenter(loadSurveys: makeRemoteLoadSurveysWithLocalFallback());
    
 
  