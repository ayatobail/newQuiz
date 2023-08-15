import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/UI/views/signup_view/signup_controller.dart';
import '../../../core/translation/app_translation.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_radioButton.dart';
import '../../shared/custom_widgets/custom_textField.dart';
import '../../shared/utilis.dart';


class signupView extends StatefulWidget {
  const signupView({Key? key}) : super(key: key);

  @override
  _signupViewState createState() => _signupViewState();
}

sinupController controller = sinupController();

class _signupViewState extends State<signupView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth(15), bottom: screenWidth(50)),
                        child: Text(
                          tr('key_createAcount1'),
                          style: TextStyle(
                              fontSize: screenWidth(20),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SvgPicture.asset(
                        'images/signup.svg',
                        height: screenHeight(2.7),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth(25),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('key_login'),
                      style: TextStyle(
                          fontSize: screenWidth(23),
                          color: AppColors.darkPurbleColor),
                    ),
                    customTextField(
                      hintTExt: tr('key_login'),
                      controller: controller.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء إدخال اسم المستخدم';
                        }
                      },
                      prefixIcon: Icons.person_outline,
                    ),
                    SizedBox(
                      height: screenWidth(30),
                    ),
                    Text(
                      tr('key_phoneNumber'),
                      style: TextStyle(
                          fontSize: screenWidth(23),
                          color: AppColors.darkPurbleColor),
                    ),
                    customTextField(
                      hintTExt: tr('key_phoneNumber'),
                      controller: controller.phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء إدخال رقم الموبايل';
                        }
                      },
                      prefixIcon: Icons.phone_outlined,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenWidth(50), bottom: screenWidth(90)),
                      child: Text(
                        "اختر الاختصاص",
                        style: TextStyle(
                            fontSize: screenWidth(23),
                            color: AppColors.darkPurbleColor),
                      ),
                    ),
                    Obx(() {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customRadiobutton(
                              text: "الطب البشري",
                              value: 1,
                              group:
                                  controller.specializationG.value,
                              onChange: (value) => controller.setSelected(value)),
                          customRadiobutton(
                            text: "طب الأسنان",
                            value: 2,
                            group:
                                controller.specializationG.value,
                            onChange: (value) => controller.setSelected(value),
                          ),
                        ],
                      );
                    }),
                    Obx(() {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customRadiobutton(
                              text: "الهندسة المعلوماتية",
                              value: 3,
                              group:
                                  controller.specializationG.value,
                              onChange: (value) => controller.setSelected(value)),
                          customRadiobutton(
                            text: "الهندسة المدنية",
                            value: 4,
                            group:
                                controller.specializationG.value,
                            onChange: (value) => controller.setSelected(value),
                          ),
                        ],
                      );
                    }),
                    Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth(50), bottom: screenWidth(50)),
                        child: customButton(
                          text: "إنشاء حساب",
                          onPressed: () {
                            controller.register();
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب؟",
                          style: TextStyle(fontSize: screenWidth(25)),
                        ),
                        InkWell(
                          onTap: (){Get.to(loginView());},
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: screenWidth(25),
                                color: AppColors.darkPurbleColor),
                          ),
                        ),
                      ],
                    ),
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
