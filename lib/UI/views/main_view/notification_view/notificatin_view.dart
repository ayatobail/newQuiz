import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
class notificationView extends StatefulWidget {
  const notificationView({Key? key}) : super(key: key);

  @override
  _notificationViewState createState() => _notificationViewState();
}

class _notificationViewState extends State<notificationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor,
    );
  }
}
