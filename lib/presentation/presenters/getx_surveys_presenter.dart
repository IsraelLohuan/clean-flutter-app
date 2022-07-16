import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:ForDev/ui/pages/surveys/survey_viewmodel.dart';
import 'package:ForDev/ui/pages/surveys/surveys.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class GetxSurveysPresenter implements SurveysPresenter {
  final LoadSurveys loadSurveys;

  final _isLoading = true.obs;
  final _surveys = Rx<List<SurveyViewModel>>();

  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<List<SurveyViewModel>> get surveysStream => _surveys.stream;

  GetxSurveysPresenter({@required this.loadSurveys});

  Future<void> loadData() async {
    try {
      _isLoading.value = true;

      final surveys = await loadSurveys.load();

      _surveys.value = surveys.map<SurveyViewModel>((survey) => SurveyViewModel(
        id: survey.id,
        question: survey.question,
        date: DateFormat('dd MMM yyyy').format(survey.dateTime),
        didAnswer: survey.didAnswer
      )).toList();

    } on DomainError {
      _surveys.subject.addError(UiError.unexpected.description);
    } finally {
      _isLoading.value = false;
    }
  }
}