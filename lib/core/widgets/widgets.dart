import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required VoidCallback onPressed,
  required String text,
  required Size size,
  Color? color,
  bool hasEdges = false,
  double? width,
  double? height,
  double? radius = 4,
}) =>
    Container(
      width: width ?? size.width * 0.08,
      height: height ?? size.height * 0.045,
      decoration: BoxDecoration(
        border: hasEdges
            ? Border.all(
                width: 0.7,
                color: ColorManager.white,
              )
            : null,
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: hasEdges ? Colors.white : ColorManager.primary,
        textColor: hasEdges ? ColorManager.primary : Colors.white,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyles.normal.copyWith(
              color: hasEdges ? ColorManager.primary : Colors.white,
              fontSize: size.height * 0.015),
        )),
      ),
    );
