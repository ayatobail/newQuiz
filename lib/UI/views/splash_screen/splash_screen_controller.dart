import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
import 'package:new_quiz/core/data/repositories/shared_preference_repositories.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController{
  void onInit()
  {
    /*Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLuanch()) {
        Get.off(introView()); //push...to/push replacement..off
      } else {
                Get.off(storage.getLoggedIn()
                    ?MainView() : LandingView());


      }

      storage.setFirstLuanch(false);
    });*/

    /*Future.delayed(Duration(seconds: 5)).then((value) {
      // if (storage.getFirstLunch()) {
      //   Get.off(IntroView());
      // } else {
      //   Get.off(storage.getLoggedIN() ? LandingView() : LandingView());
      // }
      // //Get.back();
      // storage.setFirstLunch(false);

      if (storage.getSubStatus()) {
        Get.off(LandingView());
      } else {
        customToast.showMessage(
            message: 'Your sub expired', messageType: MessageType.WARNNING);
      }
    });
    super.onInit();*/
  }

}