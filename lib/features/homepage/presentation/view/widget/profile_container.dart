import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.2,
      height: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          horizontalSpace(20),
          Image.asset(
            "assets/images/Default_Profile_pic.png",
            width: 60,
            height: 60,
          ),
          horizontalSpace(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Admin",
                style: TextStyles.headings,
              ),
              Text(
                "sama",
                style: TextStyles.normal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
