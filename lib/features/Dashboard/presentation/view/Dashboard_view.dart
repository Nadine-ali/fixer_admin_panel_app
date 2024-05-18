import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName="dashboardview"; 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 500,
      color: Color.fromARGB(255, 89, 76, 187),
      child: Text("Dashboard",style: TextStyles.boldheadings,),
    );
  }
}