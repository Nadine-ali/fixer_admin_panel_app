import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/locations/data/models/location_model.dart';

import 'package:flutter/material.dart';

class LocationCardModel extends StatelessWidget {
  final LocationModel location;

  const LocationCardModel({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.white,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Area :",
                  style:
                      TextStyles.normal.copyWith(fontWeight: FontWeight.w400),
                ),
                verticalSpace(20),
                Text("ID :",
                    style:
                        TextStyles.normal.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  location.name!,
                  style:
                      TextStyles.headings.copyWith(fontWeight: FontWeight.w400),
                ),
                verticalSpace(20),
                Text(location.id.toString(),
                    style: TextStyles.headings
                        .copyWith(fontWeight: FontWeight.w500))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
