import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/presentation/mixins/mixins.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:ForDev/ui/pages/surveys/survey_viewmodel.dart';
import 'package:ForDev/ui/pages/surveys/surveys.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class GetxSurveysPresenter with SessionManager, LoadingManager implements SurveysPresenter {
  final LoadSurveys loadSurveys;

  final _surveys = Rx<List<SurveyViewModel>>();
  final _navigateTo = RxString();

  Stream<List<SurveyViewModel>> get surveysStream => _surveys.stream;
  Stream<String> get navigateToStream => _navigateTo.stream; 

  GetxSurveysPresenter({@required this.loadSurveys});

  Future<void> loadData() async {
    try {
      isLoading = true;

      final surveys = await loadSurveys.load();

      _surveys.value = surveys.map<SurveyViewModel>((survey) => SurveyViewModel(
        id: survey.id,
        question: survey.question,
        date: DateFormat('dd MMM yyyy').format(survey.dateTime),
        didAnswer: survey.didAnswer
      )).toList();

    } on DomainError catch(error) {
      if(error == DomainError.accessDenied) {
        isSessionExpired = true;
      } else {
        _surveys.subject.addError(UiError.unexpected.description);
      }
    } finally {
      isLoading = false;
    }
  }

  @override
  void goToSurveyResult(String surveyId) {
    _navigateTo.value = '/survey_result/$surveyId';
  }
}