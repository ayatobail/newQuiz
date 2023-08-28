import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';

import '../../app/my_app_controller.dart';
import '../data/repositories/shared_preference_repositories.dart';
import '../enums/connectivity_status.dart';
import '../enums/message_type.dart';
import '../services/connectivity_service.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';

sharedPreferenceRepository get storage => Get.find<sharedPreferenceRepository>();

//CartService get cartService => Get.find<CartService>();
LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();
void fadeInTransition(Widget view) {
  Get.to(view, transition: Transition.fadeIn);
}

bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

void checkConnection(Function function) {
  if (isOnline)
   { function();}
  else {
    customToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNNING);
  }
}