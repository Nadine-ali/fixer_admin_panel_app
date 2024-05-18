
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/themes/colors.dart';

class ResetButtton extends StatelessWidget {
  const ResetButtton({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordnew = TextEditingController();
    final TextEditingController passwordconfirmation = TextEditingController();
    return 
     Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Phone : ${passwordnew.text}");
          debugPrint("Phone : ${passwordconfirmation.text}");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          fixedSize: Size(140.w, 87.h)
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
