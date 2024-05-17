
// import 'package:fixer_admin_panel_app/core/routing/routes.dart';
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin_login/presentation/view/widgets/forgot_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (bool? selection) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                checkColor: ColorManager.primary,
                activeColor: ColorManager.white,
                focusColor: ColorManager.black,
              ),
              horizontalSpace(10),
            Text("Remember me", style: TextStyles.darkheadings),],
          ),
          horizontalSpace(70),
          TextButton(
              onPressed: () {
               showDialog(context: context, 
               builder:(context)=>const ForgotPasswordDialog(),

               );
              },
              child: Text("Forgot password?", style: TextStyles.darkheadings))
        ]));
  }
}

