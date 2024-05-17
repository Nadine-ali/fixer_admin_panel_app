
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle normal = TextStyle(
    color: ColorManager.black,
    fontSize: 14.sp,
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headings = TextStyle(
    color: ColorManager.black,
    fontSize: 12.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    // height: 19.h,
    fontWeight: FontWeight.w500,
  );
  static TextStyle boldheadings = TextStyle(
    color: ColorManager.black,
    fontSize: 26.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w700,
  );
  static TextStyle darkheadings = TextStyle(
    color: ColorManager.black,
    fontSize: 8.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w500,
  );
static TextStyle lightheadings = TextStyle(
    color: ColorManager.darkgrey,
    fontSize: 6.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w600,
  );
  
 
}
