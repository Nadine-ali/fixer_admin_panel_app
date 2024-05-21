import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';

import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              Column(
                children: [
                  Text(
                    admin.name!,
                    style:
                        TextStyles.normal.copyWith(fontWeight: FontWeight.w400),
                  ),
                  verticalSpace(10),
                  Text(admin.role!,
                      style: TextStyles.normal
                          .copyWith(fontWeight: FontWeight.w500))
                ],
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
      ),
    );
  }
}
