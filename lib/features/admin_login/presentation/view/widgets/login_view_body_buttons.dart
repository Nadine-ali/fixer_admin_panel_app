
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/homepageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            debugPrint("Phone : ${phoneController.text}");
            debugPrint("Password : ${passwordController.text}");
            Navigator.of(context).pushReplacementNamed(AdminHomePageView.routeName);
          },
          style: ElevatedButton.styleFrom(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)) ,
              // shape: const StadiumBorder(),
              backgroundColor: ColorManager.primary,
              fixedSize: Size(200.w,100.h),
    
              ),
          child: Text("Sign in",
            style: TextStyle(
                color: ColorManager.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        verticalSpace(10),
        Text("or", style: TextStyles.darkheadings),
        verticalSpace(10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              side: const BorderSide(color: ColorManager.primary,
              ),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)) ,
              // shape: const StadiumBorder(),
              fixedSize: Size(200.w,100.h),
              backgroundColor: ColorManager.white,
              
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.w,
                height: 10.w,
                child: Image.asset("assets/images/google_icon.png",
                fit:BoxFit.contain ,
                ),),
              horizontalSpace(10),
              Text("Sign in with Google", style:TextStyle(
                fontSize: 8.sp,
              )),
            ],
          ),
        )
      ],
    );
  }
}
