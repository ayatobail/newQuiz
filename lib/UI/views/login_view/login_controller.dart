import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/UI/views/main_view/main_view.dart';
import 'package:new_quiz/UI/views/signup_view/signup_view.dart';
import 'package:new_quiz/core/services/base_controller.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/utilies/general_utilies.dart';
import 'package:http/http.dart' as http;

class loginController extends BaseController{

  loginController(String name){
   nameController.text=name;
  }

TextEditingController nameController = TextEditingController();
TextEditingController codeController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login()  async {
    if (formKey.currentState!.validate()) {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://6d90-5-0-32-200.ngrok-free.app/api/login'));
      request.fields.addAll({
        'name': nameController.text,
        'login_code': codeController.text
      });

customLoader();
      http.StreamedResponse response = await request.send();
      BotToast.closeAllLoading();
      if (response.statusCode == 404) {
        BotToast.closeAllLoading();
        storage.setUser(nameController.text);
        Get.to(MainView());
      }
      else {
        print(response.reasonPhrase);
      }
    }
  }}