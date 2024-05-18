import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/Dashboard_view.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/admin_view.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/side_navigation_bar.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/topbar.dart';
import 'package:flutter/material.dart';

class HomepageBody extends StatefulWidget {
  const HomepageBody
({super.key});

  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  int _selectedIndex=0;

  List<Widget> _views = [
    const DashboardView(),
    const AdminView(),
  ];

  void _onTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF0F4),
      body:Row(
        // side nav bar
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SideNavBar(selectedIndex: _selectedIndex, onTapped: _onTapped),

            Expanded(
              child: Column(
                children: [
                  TopBar(),
                  Container(
                    color: const Color.fromARGB(255, 175, 173, 173),
                    height: 1,
                  ),
                  Container(child: _views.elementAt(_selectedIndex))
                ],
              ),
            )
        ],
        
       ),
    );
  }
}

