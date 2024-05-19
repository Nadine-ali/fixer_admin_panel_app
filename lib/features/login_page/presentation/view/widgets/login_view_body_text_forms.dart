
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
        width:400,
        height:50,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(color: ColorManager.primary)),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: icon,
            hintText: text,
            hintStyle: TextStyles.lightheadings,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(6.sp),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0, 31, 24, 24)),
            ),
          ),
        )
        );
  }
}
