
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/homepage_body.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  static const String routeName="homepageview";
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageView();
}

class _HomePageView extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return const HomepageBody();
  }
}