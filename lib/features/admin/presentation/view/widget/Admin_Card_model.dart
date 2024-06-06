import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminCardModel extends StatelessWidget {
  final AdminModel admin;
  final VoidCallback toggleEditForm;
  final VoidCallback toggleProfileView;

  const AdminCardModel(
      {super.key,
      required this.toggleEditForm,
      required this.toggleProfileView,
      required this.admin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleProfileView,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorManager.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Default_Profile_pic.png",
              width: 150.w,
              height: 150.h,
            ),
            verticalSpace(30),
            Column(
              children: [
                Text(
                  admin.name!,
                  style:
                      TextStyles.normal.copyWith(fontWeight: FontWeight.w700),
                ),
                verticalSpace(10),
                Text(admin.role!,
                    style:
                        TextStyles.normal.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
            verticalSpace(35),
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
