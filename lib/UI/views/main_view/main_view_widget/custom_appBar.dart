import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/colors.dart';

import '../../../shared/utilis.dart';
class customAppbar extends StatelessWidget implements PreferredSizeWidget {
  const customAppbar({Key? key,  this.icon, required this.text, required this.height, this.color}) : super(key: key);
final double height;
final SvgPicture? icon;
final String text;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SvgPicture.asset("images/shapeMaker.svg",fit: BoxFit.cover,color: color,),
      backgroundColor: Colors.transparent,
      elevation: 0,
  automaticallyImplyLeading: false,
   title: Padding(
     padding:  EdgeInsets.only(top: screenWidth(10)),
     child: Row(
       children: [
         IconButton(
           icon:icon?? SvgPicture.asset("images/ic_arrow.svg",width: screenWidth(17),),
           onPressed: icon==null?(){
             Navigator.pop(context);
           }
           :null
         ),
         Text(text,style: TextStyle(fontSize: screenWidth(26)),)
       ],
     ),
   ),


    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height!);
}