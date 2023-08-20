import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/translation/app_translation.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/utilis.dart';
import '../../../login_view/login_view.dart';
import '../../main_view_widget/custom_appBar.dart';


class AboutUs extends StatefulWidget {
  const AboutUs();

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppbar( text: 'عن التطبيق', height: screenWidth(3.2) ,),
      body: Padding(
        padding:  EdgeInsets.only(top: screenWidth(50)),
        child: Column(
          children: [

            Center(child: SvgPicture.asset('images/pana.svg'))
          ],
        ),
      ),
    ));
  }
}
