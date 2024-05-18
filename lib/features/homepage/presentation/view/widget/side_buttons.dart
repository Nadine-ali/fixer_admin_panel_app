import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SideButton extends StatefulWidget {
  final String text;
  final String iconName;
  final Function(int) onTapped;
  final int index;
  const SideButton({super.key, required this.text,required this.iconName,required this.onTapped,required this.index});

  @override
  State<SideButton> createState() => _SideButtonState();
}

class _SideButtonState extends State<SideButton> {
  bool ishover=false;
  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onHover: (value) {
        setState(() {
          ishover=value;
        });
        
      },
      
      onTap:() => widget.onTapped(widget.index),
      child: Container(
        width: 200,
        height: 35,
        alignment: Alignment.center,
        color: ishover?const Color(0xFFEFF0F4):ColorManager.white,
        child: Row(
          children: [
            SvgPicture.asset(widget.iconName),
            horizontalSpace(20),
            Text(widget.text,style:TextStyle(color:ishover?ColorManager.primary300:ColorManager.darkgrey,fontSize: 10.sp),),
          ],
        )
      ),
    );
  }
}