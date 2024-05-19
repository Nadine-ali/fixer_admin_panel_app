<<<<<<< HEAD
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
=======
<<<<<<< HEAD

import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/dashboard_view.dart';
=======
>>>>>>> 6be2576780f0200143691515ffac39d0938920c2
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/Dashboard_view.dart';
>>>>>>> bcac925baeaeb74cff0ecbf2877015aef8b2e97d
import 'package:fixer_admin_panel_app/features/admin/presentation/view/admin_view.dart';
import 'package:fixer_admin_panel_app/features/login_page/presentation/view/admin_login_view.dart';
import 'package:fixer_admin_panel_app/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/homepage_view.dart';
import 'package:fixer_admin_panel_app/features/reset_password/presentation/view/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.width),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute:appRouter.generateRoute,
        initialRoute: AdminLoginView.routeName,
        routes: {
          AdminLoginView.routeName: (context) => const AdminLoginView(),
          ForgetPasswordView.routeName: (context) => const ForgetPasswordView(),
          ResetPasswordView.routeName: (context) => const ResetPasswordView(),
          HomePageView.routeName: (context) => const HomePageView(),
          DashboardView.routeName: (context) => const DashboardView(),
          AdminView.routeName: (context) => const AdminView(),
        },
      ),
    );
  }
}
