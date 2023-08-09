import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/utilis.dart';


import '../../../core/enums/message_type.dart';

class customToast{
  static showMessage({ 
                       required String message,
                        MessageType messageType= MessageType.INFO,}) {
    String imageName = 'info';
    Color shadowColor = AppColors.purbleColor;
    switch (messageType) {
      case MessageType.INFO:
        imageName = 'info';
        shadowColor = AppColors.blueColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'approved-01';
        shadowColor = Colors.green;
        break;
      case MessageType.WARNNING:
        imageName = 'warning';
        shadowColor = Colors.yellow;
        break;
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        shadowColor = Colors.red;
        break;

    }

    BotToast.showCustomText(
        duration: Duration(seconds: 10),
        toastBuilder: (value) {
         // final size = MediaQuery.of(context).size;
          return Container(
            width: screenWidth(3),
            height: screenHeight(3),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('images/$imageName.svg'),
                Text(
                  message,
                  style: TextStyle(fontSize: screenWidth(0.3)),
                ),
              ],
            ),
          );
        });
  }
  }
