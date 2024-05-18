import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routeName="forgotpassword";
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 1000.h,
        width: 268.w,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
    child: const ForgetPasswordBody());
  }
}
