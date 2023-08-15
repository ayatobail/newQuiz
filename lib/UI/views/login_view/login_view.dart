import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
import 'package:new_quiz/UI/views/login_view/login_controller.dart';
import 'package:new_quiz/UI/views/main_view/main_view.dart';
import 'package:new_quiz/UI/views/signup_view/signup_view.dart';

import '../../../core/translation/app_translation.dart';
class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  _loginViewState createState() => _loginViewState();
}

loginController controller=loginController();

class _loginViewState extends State<loginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth(17)),
          child: Form(
            key: controller.formKey,
            child: Column(

              children: [
                Center(
                  child: Column(
                    children: [
                     Padding(
                       padding: EdgeInsets.only(top: screenWidth(15),bottom: screenWidth(25)),
                       child: Text(tr('key_login'),style: TextStyle(fontSize: screenWidth(20),fontWeight: FontWeight.bold),),
                     ),
                      SvgPicture.asset('images/Login.svg', height: screenHeight(2.7),),

                    ],
                  ),
                ),

                SizedBox(height: screenWidth(25),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr('key_userName'),style: TextStyle(fontSize: screenWidth(23),color: AppColors.darkPurbleColor),),

                    customTextField(hintTExt: tr('key_userName'), controller: controller.emailController,validator: (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء إدخال اسم المستخدم';
                      }
                    },prefixIcon: Icons.person_outline,),

                    SizedBox(height: screenWidth(22),),

                    Text(tr('key_enterCode'),style: TextStyle(fontSize: screenWidth(23),color: AppColors.darkPurbleColor),),

                    customTextField(hintTExt: tr('key_enterCode'), controller: controller.codeController,prefixIcon: Icons.phone_outlined,validator: (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء إدخال رمز الدخول';
                      }
                    },),

                    Padding(
                      padding:  EdgeInsets.only(top: screenWidth(12),bottom: screenWidth(50)),
                      child:  customButton(
                                text:  tr('key_login'),
                                 onPressed: () {
                                 controller.login();
                                      })

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(tr("ليس لديك حساب؟"),style: TextStyle(fontSize: screenWidth(25)),),
                      InkWell(
                        onTap: (){Get.off(signupView());},
                          child: Text(tr('key_createAccount'),style: TextStyle(fontSize: screenWidth(25),color: AppColors.darkPurbleColor),)),

                    ],),
                    SizedBox(height: screenWidth(4),),
                    Center(child: InkWell(
                        onTap: (){Get.off(MainView());},
                        child: Text(tr('key_visitor'),style: TextStyle(fontSize: screenWidth(25),color: AppColors.darkPurbleColor,decoration: TextDecoration. underline)))),

                  ],

                )


              ],
            ),
          ),
        ),
      ),




    ));
  }
}

