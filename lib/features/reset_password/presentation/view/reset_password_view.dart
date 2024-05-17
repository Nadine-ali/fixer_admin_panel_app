
import 'package:fixer_admin_panel_app/features/reset_password/presentation/view/widget/reset_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName="resetpassword";
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1180.h,
        width: 268.w,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
      child: const ResetPasswordBody());
  }
}
