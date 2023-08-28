import 'package:flutter/material.dart';
import 'package:new_quiz/UI/views/main_view/main_view_widget/custom_appBar.dart';

import '../../shared/colors.dart';
import '../../shared/utilis.dart';
class questionsView extends StatefulWidget {
  const questionsView({Key? key}) : super(key: key);

  @override
  _questionsViewState createState() => _questionsViewState();
}

class _questionsViewState extends State<questionsView> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
     appBar: customAppbar(text:" كلية الهندسة المعلوماتية/الشبكات/أسئلة الكتاب", height:screenWidth(3.2) ,color: AppColors.blueColor,),
    ));
  }
}
