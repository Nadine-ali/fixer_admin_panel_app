
import 'package:fixer_admin_panel_app/features/admin_login/presentation/view/admin_login_view.dart';
import 'package:fixer_admin_panel_app/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/homepageview.dart';
import 'package:fixer_admin_panel_app/features/reset_password/presentation/view/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute:appRouter.generateRoute,
        initialRoute:AdminLoginView.routeName ,
        routes: {
          AdminLoginView.routeName:(context) => const AdminLoginView(),
          ForgetPasswordView.routeName:(context) => const ForgetPasswordView(),
          ResetPasswordView.routeName:(context) => const ResetPasswordView(),
          AdminHomePageView.routeName:(context) => const AdminHomePageView(),


        },
      ),
    );
  }
}