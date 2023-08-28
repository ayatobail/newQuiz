import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:new_quiz/UI/views/questions/questions.dart';

import '../../../screens/quiz/quiz_screen.dart';
import '../../shared/utilis.dart';
import '../main_view/main_view_widget/custom_appBar.dart';
class collegeQuestions extends StatefulWidget {
  const collegeQuestions({Key? key, required this.collegeName, required this.subject}) : super(key: key);
final String collegeName;
final String subject;
  @override
  _collegeQuestionsState createState() => _collegeQuestionsState();
}

class _collegeQuestionsState extends State<collegeQuestions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: customAppbar( text: widget.collegeName+"/"+widget.subject, height: screenWidth(3.2) ,color: AppColors.blueColor,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: screenWidth(5),bottom: screenWidth(7)),
              child: customButton(text: "دورات",textColor: AppColors.whiteColor,primary: AppColors.blueColor,),
            ),
            customButton(text: "أسئلة الكتاب",textColor: AppColors.whiteColor,primary: AppColors.darkPurbleColor,onPressed: () => Get.to(QuizScreen()),
            ),
          ],
        ),
      ),

    ));
  }
}
