import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';
import 'package:new_quiz/UI/views/main_view/main_view_widget/header_widget.dart';

import '../../../shared/utilis.dart';
class homView extends StatefulWidget {
  const homView({Key? key}) : super(key: key);

  @override
  _homViewState createState() => _homViewState();
}

TextEditingController controller=TextEditingController();
class _homViewState extends State<homView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth(30)),
          child: Column(
            children: [
            
              customTextField(hintTExt: "بحث", controller: controller,prefixIcon: Icons.search,colorText: AppColors.TextFielColor,colorfield: AppColors.fieldColor,),



            ],
          ),
        ),

      ),
    );
  }
}