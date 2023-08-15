import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/UI/views/signup_view/signup_view.dart';
import 'package:new_quiz/core/services/base_controller.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/utilies/general_utilies.dart';


class loginController extends BaseController{

  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login()  async {
    if (formKey.currentState!.validate()) {
      runFullLoadingFunction(
          function: UserRepository()
              .LogIn(code: codeController.text, userName: emailController.text
              )
              .then((value) {
            value.fold((l) {
              customToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              storage.setLoggedIn(true);
              Get.off(loginView(), transition: Transition.cupertino);
            });
          }));
    }
  }}