import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
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
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://6d90-5-0-32-200.ngrok-free.app/api/register'));
    request.fields.addAll({
      'name': nameController.text,
      'mobile_phone': phoneController.text,
      'specialization_id': specializationG.string
    });

    customLoader();
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 404) {
      BotToast.closeAllLoading();
      Get.to(loginView(name: nameController.text,));

    }
    else {
      print(response.reasonPhrase);
    }
  }
}