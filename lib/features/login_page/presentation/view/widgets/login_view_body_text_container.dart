
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final Color? color;
  final double marginRight;

  const TextContainer(
      {super.key, required this.text, this.color, required this.marginRight});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 80.h,
      margin: EdgeInsets.only(right: marginRight ),
      // color: Colors.amber,
      alignment: Alignment.centerLeft,
      child: Text(text, textAlign: TextAlign.start, style: TextStyles.normal),
    );
  }
}
