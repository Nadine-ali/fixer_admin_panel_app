import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle normal = TextStyle(
    color: ColorManager.black,
    fontSize: 8.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headings = TextStyle(
    color: ColorManager.black,
    fontSize: 10.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    // height: 19.h,
    fontWeight: FontWeight.w600,
  );
  static TextStyle boldheadings = TextStyle(
    color: ColorManager.black,
    fontSize: 24.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w700,
  );
  static TextStyle darkheadings = TextStyle(
    color: ColorManager.black,
    fontSize: 7.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle lightheadings = TextStyle(
    color: ColorManager.darkgrey,
    fontSize: 7.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w600,
  );
}
