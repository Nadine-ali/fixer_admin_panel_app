import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_model.dart';
import 'package:flutter/material.dart';

class TableContainer extends StatelessWidget {
  const TableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:1159 ,
      height: 258,
      // color: Colors.brown,
      child: Column(
        children: [
          SizedBox(
            width: 1159,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Tickets",style: TextStyles.normal.copyWith(color: ColorManager.primary)),
                Text("view All",style: TextStyles.normal.copyWith(color: ColorManager.primary,decoration: TextDecoration.underline)),
              ],
            ),
          ),
          const TableModel()
        ],
      ),
    );
  }
}