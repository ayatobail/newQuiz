

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../UI/shared/utilis.dart';
import '../UI/views/login_view/login_view.dart';
import '../core/enums/connectivity_status.dart';
import '../core/services/base_controller.dart';
import '../core/utilies/general_utilies.dart';

class MyAppController extends BaseController {
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;

  @override
  void onInit() {
    listenToConnectionStatus();


    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}
