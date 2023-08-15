import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_quiz/core/services/base_controller.dart';

import '../../../core/enums/bottom_navigation.dart';

class MainViewController extends BaseController {
  Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;
  PageController controller = PageController(initialPage: 1);

  void setSelected(BottomNavigationEnum select, int pageNumber) {
    controller.jumpToPage(pageNumber);
    selected.value = select;

  }
}

