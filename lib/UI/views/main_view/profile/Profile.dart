import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';

import 'package:image_picker/image_picker.dart';
import '../../../../../core/translation/app_translation.dart';

import '../../../shared/colors.dart';
import '../../../shared/utilis.dart';
import 'aboutus/aboutus.dart';
import 'personal_information/personal_information.dart';

class Profile extends StatefulWidget {
  const Profile();

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? imag;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                "images/shapeMaker.svg",
                width: screenWidth(1),
                // height: screenHeight(6.3),
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
                      tr('profile_profile'),
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: screenWidth(18)),
                    )
                  ],
                ),
              )
            ],
          ),

        InkWell(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
               imag = await picker.pickImage(source: ImageSource.gallery);
            },
            child: CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              radius: screenWidth(5),
              child:
              Image.asset(
                imag!.path,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(20), bottom: screenWidth(22)),
            child: Text(
              tr('key_num2'),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(25),
                  color: AppColors.blackColor),
            ),
          ),
          rowitem(
              sizestart: screenWidth(30),
              svgname: 'ic_edit',
              text: tr('profile_information'),
              color: AppColors.darkPurbleColor,
              sizeend: screenWidth(2.32),
              ontap: () {
                Get.to(PersonalInformation());
              }),
          SizedBox(
            height: screenWidth(24),
          ),
          rowitem(
              sizestart: screenWidth(25),
              sizeend: screenWidth(1.85),
              svgname: 'ic_send_feedback',
              text: tr('profile_send'),
              color: AppColors.blueColor,
              ontap: () {}),
          SizedBox(
            height: screenWidth(24),
          ),
          InkWell(
            onTap: () {},
            child: rowitem(
                sizestart: screenWidth(22),
                sizeend: screenWidth(1.8),
                svgname: 'ic_about_us',
                text: tr('profile_about'),
                color: AppColors.blackColor,
                ontap: () {
                  Get.to(AboutUs());
                }),
          ),
          SizedBox(
            height: screenWidth(15),
          ),
          customButton(
            text: tr('profile_logout'),

          )
        ],
      ),
    ));
  }
}

Widget rowitem(
    {required String svgname,
    required String text,
    required Color color,
    required double sizeend,
    required Function ontap,
    required double sizestart}) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
          child: Container(
            color: color,
            height: screenHeight(15),
            width: screenWidth(90),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: sizestart),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: screenWidth(23)),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: sizeend),
          child: SvgPicture.asset(
            'images/$svgname.svg',
            color: color,
          ),
        )
      ],
    ),
  );
}
