import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location',style: TextStyles.headings,),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Location'),
      ),
    );
  }
}