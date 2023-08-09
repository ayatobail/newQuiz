
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/core/data/repositories/shared_preference_repositories.dart';
import 'package:new_quiz/core/services/location_service.dart';
import 'package:new_quiz/core/services/location_service.dart';


import 'package:get/get.dart';



import '../../app/my_app_controller.dart';
import '../../core/enums/connectivity_status.dart';
import '../../core/enums/message_type.dart';
import '../../core/services/cart_service.dart';
import '../../core/services/cart_service.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/location_service.dart';
import '../../core/services/location_service.dart';
import '../../core/services/notification_service.dart';
import 'colors.dart';




double screenWidth(double percent) {//بترجع نسبة من عرض الشاشة
  return Get.size.width / percent;//get ofContext
}

double screenHeight(double percent) {
  return Get.size.width / percent;
}


void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
  return Container(
    width: screenWidth(5),
    height: screenWidth(5),
    decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)),
    child: SpinKitCircle(color: AppColors.purbleColor),
  );
});


