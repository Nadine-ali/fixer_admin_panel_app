import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/admin_card_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/edit_form.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminBody extends StatefulWidget {
  const AdminBody({super.key});

  @override
  State<AdminBody> createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  // bool _showInfoEntryForm = false;
  bool _showEditEntryForm = false;
  bool _showUserProfile = false;

  // void _toggleInfoEntryForm() {
  //   setState(() {
  //     _showInfoEntryForm = !_showInfoEntryForm;
  //     if (_showInfoEntryForm) {
  //      _showEditEntryForm = false;
  //       _showUserProfile = false;
  //     }
  //   });
  // }

  void _toggleEditEntryForm() {
    setState(() {
      _showEditEntryForm = !_showEditEntryForm;
      if (_showEditEntryForm) {
        _showUserProfile = false;
      }
    });
  }

  void _toggleProfileView() {
    setState(() {
      _showUserProfile = !_showUserProfile;
      if (_showUserProfile) {
        _showEditEntryForm = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_showEditEntryForm) {
      return EditInfoForm(
        onCancel: _toggleEditEntryForm,
        toggleProfileView: _toggleProfileView,
      );
    } else if (_showUserProfile) {
      return UserProfile(
        onCancel: _toggleProfileView,
        toggleEditForm: _toggleEditEntryForm,
      );
    } else {
      return _showEditEntryForm
          ? EditInfoForm(
              onCancel: _toggleEditEntryForm,
              toggleProfileView: _toggleProfileView,
            )
          : Center(
              child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: _toggleEditEntryForm,
                      child: Container(
                        width: 80.w,
                        height: 100.h,
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
                              style: TextStyles.normal
                                  .copyWith(color: ColorManager.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  SizedBox(
                    height: size.height * 0.7,
                    width: double.infinity,
                    child: GridView.count(
                      childAspectRatio: 12 / 4,
                      crossAxisCount: size.width > 1450
                          ? 4
                          : size.width > 1300
                              ? 3
                              : 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        AdminCardModel(
                          toggleEditForm: _toggleEditEntryForm,
                          toggleProfileView: _toggleProfileView,
                        ),
                        AdminCardModel(
                          toggleEditForm: _toggleEditEntryForm,
                          toggleProfileView: _toggleProfileView,
                        ),
                        AdminCardModel(
                          toggleEditForm: _toggleEditEntryForm,
                          toggleProfileView: _toggleProfileView,
                        ),
                        AdminCardModel(
                          toggleEditForm: _toggleEditEntryForm,
                          toggleProfileView: _toggleProfileView,
                        ),
                        AdminCardModel(
                          toggleEditForm: _toggleEditEntryForm,
                          toggleProfileView: _toggleProfileView,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
    }
  }
}
