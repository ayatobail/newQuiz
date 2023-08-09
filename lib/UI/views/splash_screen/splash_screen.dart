/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/views/splash_screen/splash_screen_controller.dart';
import 'package:new_quiz/core/data/repositories/shared_preference_repositories.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared/utilis.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  //SharedPreferences prefs=SharedPreferences.getInstance() as SharedPreferences;

  @override

  SplashScreenController controller=Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(child:
    Scaffold(body: Stack(

      children: [
        //SvgPicture.asset('images/bg_background.svg', height: size.height, width: size.width),
        SvgPicture.asset('images/bg_background.svg', height: screenHeight(1),
          width: screenWidth(1),
          color: Colors.grey,),
        Center(child: SvgPicture.asset(
            'images/Logo.svg', height: screenHeight(4),
            width: size.width * 0.5)),
        //SvgPicture.asset('images/ic_face.svg', height: size.height, width: size.width),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.75),
          child: SpinKitThreeBounce(
            color: AppColors.mainOrangeColor,
          ),
        )


      ],

    )

      /* width: size.width,
           height: size.height,
           color:AppColors.mainOrangeColor ,
          child: Text("Splash screen") ,*/


    ),
    );
  }
}
*/