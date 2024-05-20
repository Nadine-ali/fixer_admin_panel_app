import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/login/presentation/view/widgets/reset_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtton extends StatefulWidget {
  const NextButtton({super.key});

  @override
  State<NextButtton> createState() => _NextButttonState();
}

class _NextButttonState extends State<NextButtton> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phonenumber = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Phone : ${phonenumber.text}");
          showDialog(
              context: context,
              builder: (context) => const ResetPasswordDialog());
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primary,
            fixedSize: Size(140.w, 87.h)),
        child: Text(
          "Next",
          style: GoogleFonts.roboto(
              color: ColorManager.white,
              fontSize: 8.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
