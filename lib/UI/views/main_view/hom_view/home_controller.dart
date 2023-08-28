import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/core/data/models/apis/allSpecializationModel.dart';
import 'package:new_quiz/core/data/repositories/home_repository.dart';
import 'package:new_quiz/core/data/repositories/slider_repository.dart';
import 'package:new_quiz/core/services/base_controller.dart';

import '../../../../core/enums/message_type.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';

class homeController extends BaseController {
  RxList<Data> col = <Data>[].obs;
  RxList<String> imageList = <String>[].obs;
  RxInt index=0.obs;

  bool get isHomeLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType == OperationType.HOME;

  @override
  void onInit() {
    imagesSlider();
    collegesDisplay();
    // TODO: implement onInit
    super.onInit();
  }

  void collegesDisplay({int? id}) {
    col.clear();
        HomeRepository()
            .display()
            .then((value) {
          value.fold((l) {
            customToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            for (int i = 0; i < r.data!.length; i++) {
              if (id == r.data![i].collageId) {
                col.add(r.data![i]);
              }
              if (id == null)
                col.add(r.data![i]);
            }
          });
        })
    ;
  }


  void imagesSlider() {
    imageList.clear();
    SliderRepository()
        .display()
        .then((value)
    {
      value.fold((l) {
        customToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        for (int i = 0; i < r.data!.length; i++){
          imageList.add(r.data![i].imageUrl??"");
        }
      });
    }
    );
  }
}