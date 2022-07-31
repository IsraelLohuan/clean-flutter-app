import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/presentation/mixins/loading_manager.dart';
import 'package:ForDev/presentation/mixins/mixins.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSurveyResultPresenter extends GetxController with LoadingManager, SessionManager implements SurveyResultPresenter {
  final LoadSurveyResult loadSurveyResult;
  final SaveSurveyResult saveSurveyResult;

  final String surveyId;
  final _surveyResult = Rx<SurveyResultViewModel>();
  
  Stream<SurveyResultViewModel> get surveyResultStream => _surveyResult.stream;

  GetxSurveyResultPresenter({
    @required this.loadSurveyResult, 
    @required this.saveSurveyResult,
    @required this.surveyId,
  });

  Future<void> loadData() async {
    try {
      isLoading = true;

      final surveyResult = await loadSurveyResult.loadBySurvey(surveyId: surveyId);

      _surveyResult.value = SurveyResultViewModel(
        surveyId: surveyResult.surveyId,
        question: surveyResult.question,
        answers: surveyResult.answers.map((answer) => SurveyAnswerViewModel(
          image: answer.image,
          answer: answer.answer,
          percent: '${answer.percent}%',
          isCurrentAnswer: answer.isCurrentAnswer
        )).toList()
      );
    } on DomainError catch(error) {
      if(error == DomainError.accessDenied) {
        isSessionExpired = true;
      } else {
        _surveyResult.subject.addError(UiError.unexpected.description);
      }
    } finally {
      isLoading = false;
    }
  }

  Future<void> save({@required String answer}) async {
    isLoading = true;

    final surveyResult = await saveSurveyResult.save(answer: answer);

    _surveyResult.value = SurveyResultViewModel(
      surveyId: surveyResult.surveyId,
      question: surveyResult.question,
      answers: surveyResult.answers.map((answer) => SurveyAnswerViewModel(
        image: answer.image,
        answer: answer.answer,
        percent: '${answer.percent}%',
        isCurrentAnswer: answer.isCurrentAnswer
      )).toList()
    );
  }
}