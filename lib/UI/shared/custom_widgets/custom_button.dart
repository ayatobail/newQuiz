import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_quiz/UI/shared/utilis.dart';

import '../colors.dart';
class customButton extends StatelessWidget {
  const customButton({Key? key,  this.primary,  required this.text,  this.textColor, this.textSize,  this.onPressed, this.s}) : super(key: key);

 final Color? primary;
 //final Color? borderColor;
 final String text;
 final Color? textColor;
 final double? textSize;
 final Function? onPressed;
 //final String? svgName;
 //final double? width;
 final Size? s;




  @override
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;
    return ElevatedButton(onPressed: () {
      if (onPressed != null) onPressed!();
    },
      style: ElevatedButton.styleFrom(
          //shape: StadiumBorder(),
          primary: primary??AppColors.darkPurbleColor,
          fixedSize: s??Size(screenWidth(1), screenWidth(8)),

      ),
      child:
          Text(text,style: TextStyle(fontSize: textSize??screenWidth(22),color: textColor??AppColors.whiteColor),),

      );

  }
}
