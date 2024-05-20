import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/personal_info_form.dart';
import 'package:flutter/material.dart';

class AdminBody extends StatefulWidget {
  const AdminBody({super.key});

  @override
  State<AdminBody> createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  bool _showInfoEntryForm = false;

  void _toggleInfoEntryForm() {
    setState(() {
      _showInfoEntryForm = !_showInfoEntryForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1159,
      height: 565,
      color: Colors.amber,
      margin: const EdgeInsets.all(20),
      child: _showInfoEntryForm
          ? PersonalInfoForm(
              onCancel: _toggleInfoEntryForm,
            )
          : Center(
              child: ElevatedButton(
                onPressed: _toggleInfoEntryForm,
                child: const Text('Go to Info Entry Form'),
              ),
            ),
    );
  }
}
