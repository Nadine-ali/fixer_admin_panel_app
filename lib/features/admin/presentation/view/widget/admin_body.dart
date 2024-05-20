import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/Admin_Card_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/edit_form.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/personal_info_form.dart';
import 'package:flutter/material.dart';

class AdminBody extends StatefulWidget {
  const AdminBody({super.key});

  @override
  State<AdminBody> createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  bool _showInfoEntryForm = false;
  bool _showEditEntryForm = false;

  void _toggleInfoEntryForm() {
    setState(() {
      _showInfoEntryForm = !_showInfoEntryForm;
      if (_showInfoEntryForm) _showEditEntryForm = false;
    });
  }

  void _toggleEditEntryForm() {
    setState(() {
      _showEditEntryForm = !_showEditEntryForm;
      if (_showEditEntryForm) _showInfoEntryForm = false;
    });
  }
  // onPressed: _toggleInfoEntryForm,
  @override
  Widget build(BuildContext context) {
    if (_showInfoEntryForm) {
      return PersonalInfoForm(onCancel: _toggleInfoEntryForm);
    } else if (_showEditEntryForm) {
      return EditInfoForm(onCancel: _toggleEditEntryForm);
    } else {
    return Container(
      width: 1159,
      height: 565,
      color: ColorManager.darkwhite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: _showInfoEntryForm
          ? PersonalInfoForm(onCancel: _toggleInfoEntryForm,)
          : Center(child:Container(
                width: 1159,
                height: 565,
                color: ColorManager.darkwhite,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: _toggleInfoEntryForm,
                      child: Container(
                       width: 149,
                       height: 42, 
                       padding: const EdgeInsets.all(5),
                       margin: const EdgeInsets.only(left:1000),
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                       color: ColorManager.primary,

                       ),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.add,size:20,color: ColorManager.white,),
                          Text("Add user",style: TextStyles.normal.copyWith(color: ColorManager.white),)
                        ],
                       ),
                      ),
                    ),
                    verticalSpace(50),
                    AdminCardModel(toggleEditForm: _toggleEditEntryForm,)

                  ],
                ),
              )
            ),
    );
  }
}
}
