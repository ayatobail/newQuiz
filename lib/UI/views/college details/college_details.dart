import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_quiz/UI/views/college_questions/college_questions.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_textField.dart';
import '../../shared/utilis.dart';
import '../main_view/hom_view/home_view.dart';
import '../main_view/main_view_widget/custom_appBar.dart';
class collegeDetails extends StatefulWidget {
  const collegeDetails({Key? key, required this.collegeName}) : super(key: key);
final String collegeName;
  @override
  _collegeDetailsState createState() => _collegeDetailsState();
}

class _collegeDetailsState extends State<collegeDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: customAppbar( text: widget.collegeName, height: screenWidth(3.2) ,color: AppColors.blueColor,),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // customTextField(hintTExt: "بحث", controller: controller,prefixIcon: Icons.search,colorText: AppColors.TextFielColor,colorfield: AppColors.fieldColor,),
            SvgPicture.asset('images/ad-section.svg'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth(80)),
              child: Text("التصنيفات",style: TextStyle(fontSize: screenWidth(22)),),
            ),
            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth(30)),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Chip(label: Text("مترجمات",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) ),),
                        backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
                      ),
                          ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("داتا بيز",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),
                      backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
                      ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("اتومات",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) ),),
                        backgroundColor: Colors.transparent,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
            ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    InkWell(
                      onTap:() {Get.to(collegeQuestions(collegeName: widget.collegeName, subject: "الشبكات"));},
                      child: Chip(label: Text("الشبكات",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),

                          backgroundColor: Colors.transparent,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: AppColors.darkPurbleColor),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("الذكاء الاصطناعي",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) ),),
                        backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
                      ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("قواعد معطيات",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),
                        backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
                      ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("هندسة برمجيات",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),
                        backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
                      ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("أمن",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),
                        backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),
                      ),
                    ),
                    SizedBox(width: screenWidth(55),),
                    Chip(label: Text("خوارزميات",style: TextStyle(color:AppColors.darkPurbleColor,fontSize:screenWidth(22) )),
                        backgroundColor: Colors.transparent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.darkPurbleColor),

                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenWidth(20),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: Text("الدورات",style: TextStyle(color:AppColors.whiteColor,fontSize:screenWidth(20) )),
                    backgroundColor: AppColors.blueColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(width:screenWidth(40), ),
                Chip(label: Text("بنك الأسئلة",style: TextStyle(color:AppColors.whiteColor,fontSize:screenWidth(20) )),
                    backgroundColor: AppColors.darkPurbleColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ],
            ),
          ]
          ,

        ),
      ),
    ));
  }
}
