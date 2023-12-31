import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/utilis.dart';

import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Obx(
    () => Text.rich(
    TextSpan(
    text:
    " ${_questionController.questions.length}/${_questionController.questionNumber.value}",
    style: TextStyle(fontSize: screenWidth(20)),

    ),
    ),
    ),
    ),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ProgressBar(),
          ),
          SizedBox(height: kDefaultPadding),

          Expanded(
            child: PageView.builder(
              // Block swipe to next qn
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.questions[index]),
            ),
          ),
        ],
      ),
    );
  }
}