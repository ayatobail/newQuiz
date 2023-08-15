import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
class customTextField extends StatefulWidget {
  const customTextField({Key? key, required this.hintTExt, required this.controller, this.validator,   this.prefixIcon, this.suffexIcon, this.colorfield, this.colorText,  }) : super(key: key);

  @override
  final String hintTExt;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  //final bool showPrefix;
  final IconData? prefixIcon;
  final IconData? suffexIcon;
  final Color? colorfield;
  final Color? colorText;


  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;

    return TextFormField(

      validator: widget.validator ,
      controller:widget.controller,
      //obscureText: true,
      style: TextStyle(color: AppColors.mainBlackColor),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon,color: widget.colorText??AppColors.lightPurbleColor,),
        //suffixIcon: Icon(widget.suffexIcon,color: widget.colorText??AppColors.lightPurbleColor,),
        errorStyle: TextStyle(fontSize: screenWidth(30),color: AppColors.darkPurbleColor),
        hintText: widget.hintTExt,
        hintStyle: TextStyle(color:widget.colorText?? AppColors.lightPurbleColor,
        fontSize:screenWidth(25),
        fontWeight: FontWeight.normal),
        filled: true,
        fillColor: widget.colorfield??AppColors.lightBlueColor,
        contentPadding: EdgeInsets.symmetric(vertical: screenWidth(70)) ,
      border: OutlineInputBorder(
          //borderRadius: BorderRadius.all(Radius.circular(9.0)),
           // borderSide: BorderSide(color: Colors.white),
            borderSide: BorderSide.none,
          //borderRadius:BorderRadius.circular(screenWidth(10)),

        ),

      ),
    );
  }
}
