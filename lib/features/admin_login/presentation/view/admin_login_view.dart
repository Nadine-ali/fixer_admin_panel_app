
import 'package:fixer_admin_panel_app/features/admin_login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminLoginView extends StatelessWidget {
  static const String routeName="Admin_login_view";
  const AdminLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          SvgPicture.asset("assets/docs/fixr_wave_background.svg",
                        height:MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width*0.5,),
        SizedBox(height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width*0.5,
        child: const LoginViewBody(),
        )
        ],
      ),
      
    );
  }
}