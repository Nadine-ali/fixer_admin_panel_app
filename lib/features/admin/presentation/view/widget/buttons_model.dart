import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onCancel;
  const CancelButton({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onCancel,
      style: ElevatedButton.styleFrom(backgroundColor: ColorManager.white),
      child: const Text('Cancel'),
    );
  }
}

class AddButton extends StatelessWidget {
  final String text;
  final VoidCallback toggleProfileView;
  const AddButton({super.key,required this.text, required this.toggleProfileView});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: toggleProfileView,
      style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primary),
      child: Text(
        text,
        style: TextStyle(color: ColorManager.white),
      ),
    );
  }
}
