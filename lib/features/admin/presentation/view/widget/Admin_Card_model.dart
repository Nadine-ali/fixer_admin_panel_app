import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/edit_form.dart';
import 'package:flutter/material.dart';

class AdminCardModel extends StatefulWidget {
  const AdminCardModel({super.key});

  @override
  State<AdminCardModel> createState() => _AdminCardModelState();
}

class _AdminCardModelState extends State<AdminCardModel> {
   bool _showEditForm = false;
  void _toggleEditForm() {
    setState(() {
      _showEditForm = !_showEditForm;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 249,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.white,
      ),
      child: _showEditForm
      ?EditInfoForm(onCancel: _toggleEditForm)
      :Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          const Icon(Icons.person,color:Colors.amber,size: 40,),
          horizontalSpace(5),
          Container(
            margin: const EdgeInsets.only(right:55),
            child: Column(
              children: [ 
                Text("name",style: TextStyles.normal.copyWith(fontWeight: FontWeight.w400),),
                verticalSpace(10),
                Text("Role",style: TextStyles.normal.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
          ),
          horizontalSpace(10),
          InkWell(
            onTap:_toggleEditForm ,
            child: const Icon(Icons.edit_outlined,color:ColorManager.black,size: 25,))
        ],
      ),
    );
  }
}