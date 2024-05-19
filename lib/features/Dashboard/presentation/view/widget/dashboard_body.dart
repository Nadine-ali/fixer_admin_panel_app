import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/donut_chart_container.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_container.dart';
import 'package:flutter/material.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1200,
      height:600,
      // color: const Color.fromARGB(255, 146, 139, 204),
      padding: const EdgeInsets.all(10),
      child:Column(
        children: [
          const DonutChartContainer(),
          verticalSpace(25),
          const TableContainer(),
        
        ],
      )
    );
  }
}