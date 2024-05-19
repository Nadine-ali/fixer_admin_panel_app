
import 'package:fixer_admin_panel_app/core/routing/routes.dart';
import 'package:fixer_admin_panel_app/features/login_page/presentation/view/admin_login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.adminLogin:
        return MaterialPageRoute(
          builder: (_) => const AdminLoginView(),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

void navigateTo(context, widget) => Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ));
