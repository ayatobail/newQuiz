import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/colors.dart';

import '../../../UI/shared/utilis.dart';
import '../../../constants.dart';
import '../../../controllers/models/Questions.dart';
import '../../../controllers/question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Text(
          question.question,
        ),
        SizedBox(height: kDefaultPadding / 2),
        Column(
          children: [
            ...List.generate(
              question.options.length,
              (index) => Option(
                index: index,
                text: question.options  [index],
                press: () => _controller.checkAns(question, index),

              ),

            ),
             SizedBox(height: screenWidth(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(

                  child: Chip(
                      label: Text("السابق",style: TextStyle(color:AppColors.blueColor,fontSize:screenWidth(22) )),
                      backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.blueColor),
                      ),
                    ),
                ),

                InkWell(

                  child: Chip(
                    label: Text("التالي",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),
                    backgroundColor: Colors.transparent,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: AppColors.darkPurbleColor),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ]),
    );
  }
}
