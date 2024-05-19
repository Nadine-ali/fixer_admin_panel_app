import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/dashboard_body.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName="dashboardview"; 
  @override
  Widget build(BuildContext context) {
    return const DashBoardBody();
  }
}