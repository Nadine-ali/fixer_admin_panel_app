import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback toggleEditForm;
  final AdminModel admin;
  const UserProfile(
      {super.key,
      required this.onCancel,
      required this.toggleEditForm,
      required this.admin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 555,
      height: 618,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 555,
              height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: 115,
                    height: 115,
                    margin: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          admin.name!,
                          style: TextStyles.normal,
                        ),
                        Text(
                          admin.role!,
                          style: TextStyles.normal.copyWith(fontSize: 6.sp),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      padding: const EdgeInsets.all(30),
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: toggleEditForm),
                ],
              ),
            ),
            verticalSpace(65), // Spacing between the two containers
            // Second container
            Container(
              width: 555,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Row(
                  children: [
                    // First column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Name', style: TextStyles.lightheadings),
                          verticalSpace(60),
                          Text('ID', style: TextStyles.lightheadings),
                          verticalSpace(60),
                          Text('Username', style: TextStyles.lightheadings),
                          verticalSpace(60),
                          Text('Email', style: TextStyles.lightheadings),
                          verticalSpace(60),
                          Text('Role', style: TextStyles.lightheadings),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32), // Space between the columns
                    // Second column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            admin.name!,
                            style: TextStyles.lightheadings
                                .copyWith(color: ColorManager.black),
                          ),
                          verticalSpace(60),
                          Text(admin.id.toString(),
                              style: TextStyles.lightheadings
                                  .copyWith(color: ColorManager.black)),
                          verticalSpace(60),
                          Text(admin.username!,
                              style: TextStyles.lightheadings
                                  .copyWith(color: ColorManager.black)),
                          verticalSpace(60),
                          Text(admin.email!,
                              style: TextStyles.lightheadings
                                  .copyWith(color: ColorManager.black)),
                          verticalSpace(60),
                          Text(admin.role!,
                              style: TextStyles.lightheadings
                                  .copyWith(color: ColorManager.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
