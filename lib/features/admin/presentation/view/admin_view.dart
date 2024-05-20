import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  static const String routeName = "adminView";
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 500,
      color: Colors.amber,
      child: Text(
        "admin",
        style: TextStyles.boldheadings,
      ),
    );
  }
}
