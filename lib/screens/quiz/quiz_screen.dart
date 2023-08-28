import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/views/main_view/main_view_widget/custom_appBar.dart';

import '../../UI/shared/utilis.dart';
import '../../controllers/question_controller.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppbar(text:"كليةالهندسة المعلوماتية/الشبكات/أسئلةالكتاب", height:screenWidth(3.2)),
      body: Body(),
    );
  }
}