import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';

import '../../../../../core/translation/app_translation.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/utilis.dart';
import '../../../login_view/login_view.dart';
import '../../main_view_widget/custom_appBar.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation();

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: customAppbar(text: "تعديل المعلومات الشخصية",icon: SvgPicture.asset('images/ic_user.svg'),height: screenWidth(3.2)),

    ));
    ;
  }
}
