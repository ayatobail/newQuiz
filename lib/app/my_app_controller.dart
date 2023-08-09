

import '../UI/shared/utilis.dart';
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
