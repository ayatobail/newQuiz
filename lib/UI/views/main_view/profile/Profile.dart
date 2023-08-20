import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';

import 'package:image_picker/image_picker.dart';
import '../../../../../core/translation/app_translation.dart';

import '../../../../core/utilies/general_utilies.dart';
import '../../../shared/colors.dart';
import '../../../shared/utilis.dart';
import '../main_view_widget/custom_appBar.dart';
import 'aboutus/aboutus.dart';
import 'personal_information/personal_information.dart';

class Profile extends StatefulWidget {
  const Profile();

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: customAppbar( text: 'الملف الشخصي',icon:SvgPicture.asset('images/ic_user.svg'), height: screenWidth(3.2) ,),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Column(
          children: [
            SvgPicture.asset('images/User-100.svg',),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(30), bottom: screenWidth(8)),
              child: Text(
                storage.getUser(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth(22),
                    ),
              ),
            ),
            rowitem(
                svgname: 'edit',
                text: tr('profile_information'),
                color: AppColors.darkPurbleColor,
                ontap: () {
                  Get.to(PersonalInformation());
                }, ),
            SizedBox(
              height: screenWidth(24),
            ),
            rowitem(
                svgname: 'ic_send',
                text: tr('profile_send'),
                color: AppColors.blueColor,
                ontap: () {}, ),
            SizedBox(
              height: screenWidth(24),
            ),
            InkWell(
              onTap: () {},
              child: rowitem(
                  svgname: 'ic_info',
                  text: tr('profile_about'),
                  color: AppColors.blackColor,
                  ontap: () {
                    Get.to(AboutUs());
                  },),
            ),
            SizedBox(
              height: screenWidth(8),
            ),
           customButton(text: "تسجيل الخروج")


          ],
        ),
      ),
    ));
  }
}

Widget rowitem(
    {required String svgname,
    required String text,
    required Color color,
    required Function ontap,

    }) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Row(
      children: [
        Container(
          color: color,
          height: screenHeight(15),
          width: screenWidth(90),
        ),
        SizedBox(width: screenWidth(35),),
        Text(
          text,
          style: TextStyle(color: color, fontSize: screenWidth(23)),
        ),
       Spacer(),
        SvgPicture.asset(
          'images/$svgname.svg',
          color: color,
        )
      ],
    ),
  );
}
