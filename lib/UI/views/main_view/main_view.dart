import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_drawer.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
import 'package:new_quiz/UI/views/main_view/hom_view/home_view.dart';
import 'package:new_quiz/UI/views/main_view/important_view/important_view.dart';
import 'package:new_quiz/UI/views/main_view/main_controller.dart';

import 'package:new_quiz/UI/views/main_view/notification_view/notificatin_view.dart';
import 'package:new_quiz/UI/views/main_view/profile/Profile.dart';



import 'main_view_widget/botton_navigation_widget.dart';


class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
 MainViewController controller=Get.put(MainViewController());
 GlobalKey<ScaffoldState> key= GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        return Scaffold(
          key: key,
          drawer:CustomDrawer(),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
                  flexibleSpace: SvgPicture.asset("images/shapeMaker.svg",fit: BoxFit.cover,),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: screenWidth(3),
            

          ),
          // backgroundColor: AppColors.transparentColor,
          bottomNavigationBar:
            BottomNavigationWidget(navitm: controller.selected.value,
                ontap: (select, pageNumber) =>
                    controller.setSelected(select, pageNumber)),



          body: PageView(
            controller: controller.controller,
            children: [
              notificationView(),
              homView(),
              importantView(),
Profile()         ],
          ),

        );
  }
      ),
    );
  }
}
