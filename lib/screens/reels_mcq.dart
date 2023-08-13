import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quiz_controller.dart';
import '../widgets/mcq_widget.dart';

class ReelsMcq extends StatelessWidget {
  ReelsMcq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final QuizController quizController = Get.put(QuizController());

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: quizController.questions.length,
      onPageChanged: (index) {
        quizController.currentPageIndex.value = index;
      },
      itemBuilder: (context, index) {
        return McqWidget(quizController:quizController,index:index);
      },
    );
  }
}
