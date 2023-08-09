import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/utilis.dart';
class customTextField extends StatefulWidget {
  const customTextField({Key? key, required this.hintTExt, required this.controller, this.validator,   this.prefixIcon,  }) : super(key: key);

  @override
  final String hintTExt;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  //final bool showPrefix;
  final IconData? prefixIcon;

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;

    return SizedBox(
      height: screenWidth(8),
      child: TextFormField(

        validator: widget.validator ,
        controller:widget.controller,
        //obscureText: true,
        style: TextStyle(color: AppColors.blackColor),
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon,color: AppColors.lightPurbleColor,),
          errorStyle: TextStyle(fontSize: screenWidth(3)),
          hintText: widget.hintTExt,
          hintStyle: TextStyle(color:  AppColors.lightPurbleColor,
          fontSize:screenWidth(25),
          fontWeight: FontWeight.normal),
          filled: true,
          fillColor: AppColors.lightBlueColor,
          contentPadding: EdgeInsets.symmetric(vertical: screenWidth(70)) ,
        border: OutlineInputBorder(
            //borderRadius: BorderRadius.all(Radius.circular(9.0)),
             // borderSide: BorderSide(color: Colors.white),
              borderSide: BorderSide.none,
            //borderRadius:BorderRadius.circular(screenWidth(10)),

          ),

        ),
      ),
    );
  }
}
