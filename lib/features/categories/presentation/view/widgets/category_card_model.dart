import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/category_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCardModel extends StatelessWidget {
  final String serviceimage;
  final String text;
  final VoidCallback toggleAddForm;
  final VoidCallback toggleServiceTable;
  final Size size;
  const CategoryCardModel({super.key, required this.serviceimage, required this.text, required this.toggleAddForm, required this.toggleServiceTable, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 500.h,
      decoration: BoxDecoration(color: ColorManager.white,
      borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 280.w,
            height: 280.h,
            child: Image.asset(serviceimage,fit: BoxFit.contain,)),
          verticalSpace(15),
          Text(
            text,
            style: TextStyles.headings,
          ),
          verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ServiceButton(color: ColorManager.white,
            borderColor:ColorManager.primary , 
            text:"View Services", 
            textColor: ColorManager.primary,
            onpressed: toggleServiceTable,
            hasEdges: true,
            size: size,
            ),
            ServiceButton(color: ColorManager.primary,
            borderColor:ColorManager.primary , 
            text:"Add Service", 
            textColor: ColorManager.white,
            onpressed: toggleAddForm,
            hasEdges: false,
            size: size,
            )
            ])
            
        ]));
  }
}