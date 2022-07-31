import 'package:ForDev/domain/entities/entities.dart';
import 'package:ForDev/ui/pages/survey_result/survey_answer_viewmodel.dart';
import 'package:ForDev/ui/pages/survey_result/survey_result_viewmodel.dart';

extension SurveyResultEntityExtensions on SurveyResultEntity {
  SurveyResultViewModel toViewModel() => SurveyResultViewModel(
    surveyId: this.surveyId,
    question: this.question,
    answers: this.answers.map((answer) => answer.toViewModel()).toList()
  );
}

extension SurveyAnswerEntityExtensions on SurveyAnswerEntity {
  SurveyAnswerViewModel toViewModel() => SurveyAnswerViewModel( 
    image: this.image,
    answer: this.answer, 
    isCurrentAnswer: this.isCurrentAnswer,
    percent: '$percent%'
  );
}