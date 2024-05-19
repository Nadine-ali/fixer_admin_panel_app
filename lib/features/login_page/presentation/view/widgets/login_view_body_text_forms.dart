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
<<<<<<< HEAD:lib/features/login_page/presentation/view/widgets/login_view_body_text_forms.dart
        width:400,
        height:50,
=======
        width: 400,
        height: 50,
        padding: EdgeInsets.only(top: 5.h, left: 10.w),
>>>>>>> bcac925baeaeb74cff0ecbf2877015aef8b2e97d:lib/features/admin_login/presentation/view/widgets/login_view_body_text_forms.dart
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(color: ColorManager.primary)),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
<<<<<<< HEAD:lib/features/login_page/presentation/view/widgets/login_view_body_text_forms.dart
            contentPadding: const EdgeInsets.all(16),
=======
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
>>>>>>> bcac925baeaeb74cff0ecbf2877015aef8b2e97d:lib/features/admin_login/presentation/view/widgets/login_view_body_text_forms.dart
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
        ));
  }
}
