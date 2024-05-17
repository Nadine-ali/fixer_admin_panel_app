
import 'package:fixer_admin_panel_app/features/admin_login/presentation/view/widgets/admin_login_card.dart';
import 'package:fixer_admin_panel_app/features/admin_login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdminLoginView extends StatelessWidget {
  static const String RouteName="Admin_login_view";
  const AdminLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          SvgPicture.asset("assets/docs/fixr_wave_background.svg",
                        height:MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width*0.5,),
        Container(height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width*0.5,
        color: const Color.fromARGB(255, 183, 214, 229),
        child: LoginViewBody(),
        )
        ],
      ),
      
    );
  }
}