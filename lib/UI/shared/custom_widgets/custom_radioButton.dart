import 'package:flutter/material.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
import 'package:new_quiz/core/enums/specialization.dart';
class customRadiobutton extends StatelessWidget {
  const customRadiobutton({Key? key,required this.text,required this.value,required this.onChange, required this.group}) : super(key: key);
 final String text;
  final int value;
  final int group;
  final Function(int?) onChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Radio(value:value,
              groupValue:group,
              onChanged: onChange,
          activeColor: AppColors.darkPurbleColor,),

          Text(text,style: TextStyle(fontSize: screenWidth(25)),)
        ],


      ),
    );
  }
}
