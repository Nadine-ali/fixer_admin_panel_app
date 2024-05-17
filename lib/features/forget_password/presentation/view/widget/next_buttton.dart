
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
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
          // Navigator.of(context).pushNamed(Routes.resetPassword);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          fixedSize: Size(170.w, 97.h)
        ),
        child: Text("Next",
          style: GoogleFonts.roboto(
              color: ColorManager.white,
              fontSize: 8.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
