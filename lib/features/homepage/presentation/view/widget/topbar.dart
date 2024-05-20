import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: size.width > 1050
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (size.width > 1050)
            Container(
              margin: EdgeInsets.only(left: size.height * 0.02),
              child: Text(
                "Dashboard/Home",
                style: TextStyles.headings,
              ),
            ),
          Container(
            width: size.width * 0.2,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                suffixIcon: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.06,
                  decoration: const BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (size.width < 1050) horizontalSpace(size.width * 0.2),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: SvgPicture.asset(
                      "assets/docs/Avatar.svg",
                      fit: BoxFit.cover,
                    )),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 35,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
