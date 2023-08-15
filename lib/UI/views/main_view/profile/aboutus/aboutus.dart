import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/translation/app_translation.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/utilis.dart';
import '../../../login_view/login_view.dart';


class AboutUs extends StatefulWidget {
  const AboutUs();

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                      "images/ic_back.svg",
                      color: AppColors.whiteColor,
                      height: screenWidth(15),
                    ),
                    SizedBox(
                      width: screenWidth(25),
                    ),
                    Text(
                      tr('about_us'),
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
            padding: EdgeInsetsDirectional.only(top: screenWidth(3)),
            child: SvgPicture.asset('images/pana.svg'),
          )
        ],
      ),
    ));
  }
}
