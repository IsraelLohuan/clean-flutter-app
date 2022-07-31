import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/domain/helpers/helpers.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:ForDev/presentation/mixins/loading_manager.dart';
import 'package:ForDev/presentation/mixins/mixins.dart';
import 'package:ForDev/ui/helpers/errors/errors.dart';
import 'package:ForDev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:ForDev/presentation/helpers/helpers.dart';

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
    showResultOnAction(() => loadSurveyResult.loadBySurvey(surveyId: surveyId));
  }

  Future<void> save({@required String answer}) async {
    showResultOnAction(() => saveSurveyResult.save(answer: answer));
  }

  Future<void> showResultOnAction(Future<SurveyResultEntity> action()) async {
    try {
      isLoading = true;
      final surveyResult = await action();
      _surveyResult.subject.add(surveyResult.toViewModel());
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
}

