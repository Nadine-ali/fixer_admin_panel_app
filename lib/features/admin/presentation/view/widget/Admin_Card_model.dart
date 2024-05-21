import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';

import 'package:flutter/material.dart';

class AdminCardModel extends StatelessWidget {
  final VoidCallback toggleEditForm;
  final VoidCallback toggleProfileView;

  const AdminCardModel(
      {super.key,
      required this.toggleEditForm,
      required this.toggleProfileView});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: toggleProfileView,
      child: Container(
        width: 249,
        height: 80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.amber,
              size: 40,
            ),
            horizontalSpace(5),
            Container(
              margin: const EdgeInsets.only(right: 55),
              child: Column(
                children: [
                  Text(
                    "name",
                    style:
                        TextStyles.normal.copyWith(fontWeight: FontWeight.w400),
                  ),
                  verticalSpace(10),
                  Text("Role",
                      style: TextStyles.normal
                          .copyWith(fontWeight: FontWeight.w500))
                ],
              ),
            ),
            horizontalSpace(10),
            InkWell(
                onTap: toggleEditForm,
                child: const Icon(
                  Icons.edit_outlined,
                  color: ColorManager.black,
                  size: 25,
                ))
          ],
        ),
      ),
    );
  }
}
