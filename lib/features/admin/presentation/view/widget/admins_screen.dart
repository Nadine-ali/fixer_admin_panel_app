import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/admin_body.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/admin_card_model.dart';
import 'package:flutter/material.dart';

class AdminsScreen extends StatefulWidget {
  const AdminsScreen({
    super.key,
  });

  @override
  State<AdminsScreen> createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<AdminsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1159,
      height: 565,
      color: ColorManager.darkwhite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: Container(
        width: 1159,
        height: 565,
        color: ColorManager.darkwhite,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 149,
                height: 42,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 1000),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 20,
                      color: ColorManager.white,
                    ),
                    Text(
                      "Add user",
                      style:
                          TextStyles.normal.copyWith(color: ColorManager.white),
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(50),
            AdminCardModel(
              toggleEditForm: () {},
              toggleProfileView: () {},
            )
          ],
        ),
      )),
    );
  }
}
