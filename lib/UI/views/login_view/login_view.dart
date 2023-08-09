import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';
import 'package:new_quiz/UI/shared/utilis.dart';

import '../../../core/translation/app_translation.dart';
class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  _loginViewState createState() => _loginViewState();
}

TextEditingController emailController =
TextEditingController();
TextEditingController passwordController =
TextEditingController();

class _loginViewState extends State<loginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth(17)),
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
                Text("اسم المستخدم",style: TextStyle(fontSize: screenWidth(23),color: AppColors.darkPurbleColor),),

                customTextField(hintTExt: "اسم المستخدم", controller: emailController,prefixIcon: Icons.person_outline,),

                SizedBox(height: screenWidth(20),),

                Text("رمز الدخول",style: TextStyle(fontSize: screenWidth(23),color: AppColors.darkPurbleColor),),

                customTextField(hintTExt: "رمز الدخول", controller: passwordController,prefixIcon: Icons.person_outline,),
                
                Padding(
                  padding:  EdgeInsets.only(top: screenWidth(12),bottom: screenWidth(50)),
                  child: customButton(text: "تسجيل الدخول"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("ليس لديك حساب؟",style: TextStyle(fontSize: screenWidth(25)),),
                  Text("أنشئ حسابك الآن",style: TextStyle(fontSize: screenWidth(25),color: AppColors.darkPurbleColor),),

                ],),
                SizedBox(height: screenWidth(4),),
                Center(child: Text("المتابعة كزائر",style: TextStyle(fontSize: screenWidth(25),color: AppColors.darkPurbleColor,decoration: TextDecoration. underline))),


              ],

            )


          ],
        ),
      ),




    ));
  }
}


