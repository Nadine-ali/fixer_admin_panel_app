
import 'package:fixer_admin_panel_app/features/login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminLoginView extends StatefulWidget {
  static const String routeName="Admin_login_view";
  const AdminLoginView({super.key});

  @override
  State<AdminLoginView> createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends State<AdminLoginView> {
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