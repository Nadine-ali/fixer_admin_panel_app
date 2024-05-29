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
  const SideButton(
      {super.key,
      required this.text,
      required this.iconName,
      required this.onTapped,
      required this.index});

  @override
  State<SideButton> createState() => _SideButtonState();
}

class _SideButtonState extends State<SideButton> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      onTap: () => widget.onTapped(widget.index),
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(left:20.sp),
              width: 80.w,
              height: size.height * 0.04,
              alignment: Alignment.center,
              color: ishover ? ColorManager.darkwhite : ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(widget.iconName),
                  horizontalSpace(10),
                  Text(
                    widget.text,
                    style: TextStyle(
                        color: ishover
                            ? ColorManager.primary300
                            : ColorManager.darkgrey,
                        fontSize: 10.sp),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
