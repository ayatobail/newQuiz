import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';

import '../../../../../core/translation/app_translation.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/utilis.dart';
import '../../../login_view/login_view.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation();

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Get.to(loginView());
                },
                child: SvgPicture.asset(
                  "images/shapeMaker.svg",
                  width: screenWidth(1),
                  // height: screenHeight(6.3),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(15), start: screenWidth(15)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "images/ic_text_field_user.svg",
                      color: AppColors.whiteColor,
                      height: screenWidth(15),
                    ),
                    SizedBox(
                      width: screenWidth(25),
                    ),
                    Text(
                      tr('personal_edit'),
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: screenWidth(18)),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: screenWidth(1.5)),
            child: Text("ادهم تدمري "),
          ),
         /* customTextField(
            hitText: 'ادهم تدمري',
            svgImagename: 'ic_text_field_user',
            // sizewidth: 1,
            backcolor: AppColors.bluecolor,
            // sizehight: 2,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: screenWidth(1.5)),
            child: Text(
              "رقم الهاتف  ",
              style: TextStyle(
                  fontSize: screenWidth(20), color: AppColors.mainburbleColor),
            ),
          ),
          CustomTextField(
            iconcolor: AppColors.mainburbleColor,
            hitText: 'رقم الهاتف ',
            svgImagename: 'ic_text_field_phone',
            // sizewidth: 1,
            backcolor: AppColors.bluecolor,
            // sizehight: 2,
          )*/
        ],
      ),
    ));
    ;
  }
}
