import 'package:fixer_admin_panel_app/features/reset_password/presentation/view/reset_password_view.dart';
import 'package:flutter/material.dart';

class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: ResetPasswordView(),
    );
  }
}