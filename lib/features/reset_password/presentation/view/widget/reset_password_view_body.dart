
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/reset_password/presentation/view/widget/reset_button.dart';
import 'package:fixer_admin_panel_app/features/reset_password/presentation/view/widget/reset_password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/text_styles.dart';


class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final TextEditingController passwordnew = TextEditingController();
  final TextEditingController passwordconfirmation = TextEditingController();
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
      // crossAxisAlignment: CrossAxisAlignment.start, 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpace(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 90.h,
                    width: 22.w,
                    margin: const EdgeInsets.only(left: 20),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.white,
                     ),
                child: Icon(Icons.arrow_back_ios_new_rounded,size:25 ,color:Colors.black,))
              ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 90.h,
                    width: 22.w,
                    margin: const EdgeInsets.only(right: 20),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                     ),
                     child: const Icon(Icons.close_rounded,color: Colors.white,size: 25,),
                  ),
                ),
              ],
            ),
        verticalSpace(25),
        Text(
          "Reset password",
          style: TextStyles.headings,
        ),
        verticalSpace(40),
        Padding(
            padding:EdgeInsets.only(right: 140.w),
            child: Text(
              "New password",
              style: TextStyles.normal,
            )),
        verticalSpace(5),
        ResetPasswordTextField(
          controller: passwordnew,
          text:"Enter your new password ",
          textInputType: TextInputType.text,
          obscure: obscure,
          icon: GestureDetector(
            onTap: () {
              setState(() {
                obscure = !obscure;
              });
            },
            child: setpasswordIcon(),
          ),
        ),
        verticalSpace(25),
        Padding(
            padding:EdgeInsets.only(right: 100.w),
            child: Text(
              "Confirm new password",
              style: TextStyles.normal,
            )),
        verticalSpace(5),
        ResetPasswordTextField(
            textInputType: TextInputType.text,
            obscure: obscure,
            controller: passwordconfirmation,
            text:"Confirm your new password",

            icon: GestureDetector(
              onTap: () {
                setState(() {
                  obscure = !obscure;
                });
              },
              child: setpasswordIcon(),
            )),
        verticalSpace(30),
        const ResetButtton()
      ]),
    ]);
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return Icon(
        Icons.visibility,
        size: 15.sp,
      );
    } else {
      return Icon(Icons.visibility_off, size: 15.sp);
    }
  }
}
