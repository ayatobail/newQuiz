import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/UI/views/main_view/main_view.dart';
import 'package:new_quiz/core/services/base_controller.dart';
import 'package:new_quiz/core/utilies/general_utilies.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import 'package:http/http.dart' as http;

import '../../shared/utilis.dart';

class sinupController extends BaseController{

  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  RxInt specializationG=1.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setSelected(val){
    specializationG.value=val;

  }

  Future<void> register()  async {
    if (formKey.currentState!.validate()) {
      customLoader();
      UserRepository().register(userName: nameController.text,
          code: phoneController.text,
          specialization: specializationG.string
      ).then((value) {
        value.fold((l) {
          customToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          BotToast.closeAllLoading();
          Get.off(MainView(), transition: Transition.cupertino);
        });
      });
    }
  }
}