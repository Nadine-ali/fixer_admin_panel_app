import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Size size;
  final VoidCallback onpressed;
  final bool hasEdges;
  const ServiceButton({super.key, required this.color, required this.text, required this.textColor, required this.borderColor, required this.onpressed, required this.size, required this.hasEdges});

  @override
  Widget build(BuildContext context) {
    return defaultButton(
      onPressed: onpressed, 
      text: text, 
      size: size,
      height:70.h,
      width: 55.w,
      hasEdges: hasEdges,
      radius: 3,
      )
    
    ;
  }
}