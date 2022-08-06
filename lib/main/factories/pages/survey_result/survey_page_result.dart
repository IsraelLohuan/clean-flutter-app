
import 'package:get/get.dart';

import '../../factories.dart';
import 'package:forDev/ui/pages/survey_result/survey_result_page.dart';
import 'package:flutter/material.dart';

Widget makeSurveyResultPage() => SurveyResultPage(makeGetxSurveyResultPresenter(Get.parameters['survey_id'] ?? ''));