
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/bottom_navigation.dart';

import '../../../shared/colors.dart';
import '../../../shared/utilis.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
  { required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: screenWidth(1),
          height: screenHeight(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9)),
        ),
        Positioned(
          bottom: screenWidth(25),
          left: screenWidth(20),
          right: screenWidth(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              navItem(
                ontap: () {
                  widget.ontap(BottomNavigationEnum.PROFILE, 3);
                },
                imagename: 'ic_profile',
                isslected: widget.navitm == BottomNavigationEnum.PROFILE,
              ),

              navItem(
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.STAR, 2);
                  },
                  imagename: 'ic_star',
                  isslected: widget.navitm == BottomNavigationEnum.STAR),

              navItem(
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.HOME, 1);
                  },
                  imagename: 'ic_home',
                  isslected: widget.navitm == BottomNavigationEnum.HOME),

              navItem(
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.NOTIFICATION, 0);
                  },
                  imagename: 'ic_notification',
                  isslected:
                  widget.navitm == BottomNavigationEnum.NOTIFICATION),
            ],
          ),
        ),
      ],
    );
  }


}

Widget navItem(
    {required String imagename,
      required bool isslected,
      required Function ontap}) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Column(
      children: [
        SvgPicture.asset(
          'images/$imagename.svg',
          color: AppColors.darkPurbleColor, // تحديد حجم الصورة بناءً على isSelected
        ),
        SizedBox(
          height: screenWidth(50),
        ),
        isslected
            ?
        Container(
            height: screenWidth(200),
            width: screenWidth(6), // تعديل ارتفاع الخط حسب الحاجة
            color:AppColors.darkPurbleColor // تحديد لون الخط بناءً على isSelected
        ):
        Container()
      ],
    ),
  );
}