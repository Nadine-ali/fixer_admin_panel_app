
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/homepagebody.dart';
import 'package:flutter/material.dart';

class AdminHomePageView extends StatefulWidget {
  static const String routeName="adminhomepage";
  const AdminHomePageView({super.key});

  @override
  State<AdminHomePageView> createState() => _AdminHomePageViewState();
}

class _AdminHomePageViewState extends State<AdminHomePageView> {
  @override
  Widget build(BuildContext context) {
    return const HomepageBody();
  }
}