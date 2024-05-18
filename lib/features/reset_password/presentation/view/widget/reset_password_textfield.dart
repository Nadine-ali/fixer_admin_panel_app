
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors.dart';

class ResetPasswordTextField extends StatelessWidget {
  const ResetPasswordTextField(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure,
      required this.icon});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        height:100.h,
        width: 190.w,
        alignment: Alignment.center,
        child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscure,
            style: TextStyles.headings,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: text,
                hintStyle: TextStyles.lightheadings,
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: icon,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.sp),
                    borderSide:
                        BorderSide(width: 1.sp, color: ColorManager.black)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.sp),
                    borderSide:
                        BorderSide(width: 1.sp, color: ColorManager.black)))));
  }
}
