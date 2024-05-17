
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/forget_password/presentation/view/widget/next_buttton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phonenumber = TextEditingController();
    return Center(
      child: ListView(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            verticalSpace(60),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 90.h,
                width: 22.w,
                margin: const EdgeInsets.only(left: 480),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorManager.primary,
                 ),
                 child: const Icon(Icons.close_rounded,color: Colors.white,size: 25,),
              ),
            ),
            verticalSpace(25),
            Text("Forgot password",
              style: TextStyles.headings,
            ),
            verticalSpace(100),
            Text("We’ll send a verification code to this\nnumber if it matches an existing account",
              style: TextStyles.lightheadings,
              textAlign: TextAlign.center,
            ),
            verticalSpace(60),
            Padding(
                padding:EdgeInsets.only(right:140.w),
                child: Text("Phone number",
                  style: TextStyles.normal,
                )),
            Container(
              // height:170.h,
              width: 210.w,
              alignment: Alignment.center,
                child: TextFormField(
                    controller: phonenumber,
                    keyboardType: TextInputType.phone,
                    style: TextStyles.headings,
                    textAlign:TextAlign.left,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:"Enter your phone number",
                        hintStyle: TextStyles.lightheadings,
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                            borderSide: const BorderSide(
                                width: 1, color: ColorManager.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                            borderSide: const BorderSide(
                                width: 1, color: ColorManager.black))))),
            verticalSpace(55),
            const NextButtton()
          ])
        ],
      ),
    );
  }
}
