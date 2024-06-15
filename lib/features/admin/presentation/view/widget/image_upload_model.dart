import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadModel extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  const ImageUploadModel({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyles.headings,
        ),
        verticalSpace(50),
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Container(
              height: size.height * 0.06,
              width: width,
              margin: const EdgeInsets.all(3),
              child: Image.asset("assets/images/upload.png")),
        ),
      ],
    );
  }
}
