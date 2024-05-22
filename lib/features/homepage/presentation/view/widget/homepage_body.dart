import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/manager/cubit/dashboard_cubit.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/dashboard_view.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/admin_view.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/presentation/widgets/craftsmen_view.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/side_navigation_bar.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/topbar.dart';
import 'package:fixer_admin_panel_app/features/locations/presentation/locations_view.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageBody extends StatefulWidget {
  const HomepageBody({super.key});

  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const DashboardView(),
    const StroeView(),
    const CraftsmenView(),
    const SizedBox(
      child: Text("categories"),
    ),
    BlocProvider(
      create: (context) =>
          DashboardCubit(getIt<DashBoardRepoImpl>())..getDashboardData(),
      child: const TableModel(),
    ),
    const AdminView(),
    const SelectLocations(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: size.width < 1050
          ? Drawer(
              child: SideNavBar(
                selectedIndex: _selectedIndex,
                onTapped: _onTapped,
              ),
            )
          : null,
      backgroundColor: const Color(0xFFEFF0F4),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (size.width < 1050)
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          if (size.width > 1050)
            SideNavBar(selectedIndex: _selectedIndex, onTapped: _onTapped),
          Expanded(
            child: Column(
              children: [
                TopBar(),
                Container(
                  color: const Color.fromARGB(255, 175, 173, 173),
                  height: 1,
                ),
                verticalSpace(50),
                Expanded(
                  child: SingleChildScrollView(
                    child: _views.elementAt(_selectedIndex),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
