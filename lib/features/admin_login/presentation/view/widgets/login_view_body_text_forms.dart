
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
    this.icon,
  });
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        height:120.h,
        width: 240.w,
        padding: EdgeInsets.only(top: 5.h,left: 15.w),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(color: ColorManager.primary)),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
            suffixIcon: icon,
            hintText: text,
            hintStyle: TextStyles.lightheadings,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0, 31, 24, 24)),
            ),
          ),
        ));
  }
}
