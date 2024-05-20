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
        children: [
          Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: ColorManager.grey,
                  borderRadius: BorderRadius.circular(50)),
              child: SvgPicture.asset(
                "assets/docs/Avatar.svg",
                fit: BoxFit.cover,
              )),
          horizontalSpace(15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin",
                style: TextStyles.normal,
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
