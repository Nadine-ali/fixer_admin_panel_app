import 'package:fixer_admin_panel_app/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: const ForgetPasswordView());
    
    
    }
}

