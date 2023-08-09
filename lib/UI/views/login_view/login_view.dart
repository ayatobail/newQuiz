import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/utilis.dart';

import '../../../core/translation/app_translation.dart';
class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Padding(
               padding: EdgeInsets.symmetric(vertical: screenWidth(15)),
               child: Text(tr('key_login'),style: TextStyle(fontSize: screenWidth(17)),),
             ),
              SvgPicture.asset('images/Login.svg', height: screenHeight(2.3), width: screenWidth(2.5),),

            ],
          ),


        ],
      ),




    ));
  }
}


