import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/core/services/base_controller.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/enums/specialization.dart';

class sinupController extends BaseController{

  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  RxInt specializationG=1.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setSelected(val){
    specializationG.value=val;

  }




  Future<void> register()  async {
    if (formKey.currentState!.validate()) {
      runFullLoadingFunction(
          function: UserRepository()
              .register(userName: emailController.text, code:phoneController.text, specialization: specializationG.toString() ,
          )
              .then((value) {
            value.fold((l) {
              customToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {

              Get.off(loginView(), transition: Transition.cupertino);
            });
          }));
    }
  }
}