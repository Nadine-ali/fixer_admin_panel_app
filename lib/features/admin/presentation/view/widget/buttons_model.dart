import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onCancel;
  const CancelButton({super.key,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onCancel,
      style: ElevatedButton.styleFrom(
       backgroundColor: ColorManager.white
      ),
      child: const Text('Cancel'),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:() {
        
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary
      ),
      child: const Text('Add',style: TextStyle(color: ColorManager.white),),
    );
  }
}
