import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldModel extends StatelessWidget {
  final double width;
  final String text; 
  final TextEditingController controller;
  const TextFieldModel({super.key,required this.width,required this.text,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(text,style: TextStyles.normal.copyWith(fontWeight: FontWeight.w500),),
        Container(
          height:38 ,
          width:width ,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),color: ColorManager.white,
            border: Border.all(color: ColorManager.grey)
            ),
          child: TextField(
           controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: text,
            hintStyle: TextStyles.lightheadings.copyWith(fontWeight: FontWeight.w400),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
        )


          ),
      ],
    );
  }
}

