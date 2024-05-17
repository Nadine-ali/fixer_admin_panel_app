import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routename="forgotpassword";
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
    height: 1180.h,
        width: 268.w,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
    child: ForgetPasswordBody());
  }
}
