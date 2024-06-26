import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/profile_container.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/widget/side_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTapped;
  const SideNavBar(
      {super.key, required this.selectedIndex, required this.onTapped});

  @override
  State<SideNavBar> createState() => _SidenavBarState();
}

class _SidenavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30), topRight: Radius.circular(30))),
      width: size.width * 0.2,
      child: Column(
        children: [
          verticalSpace(15),
          const ProfileBox(),
          verticalSpace(15),
          Container(
            color: const Color.fromARGB(255, 175, 173, 173),
            height: 1,
          ),
          verticalSpace(60),
          SideButton(
            text: "Dashboard",
            iconName: "assets/docs/DashboardIcon.svg",
            onTapped: widget.onTapped,
            index: 0,
          ),
          verticalSpace(60),
          SideButton(
            text: "Stores",
            iconName: "assets/docs/storesIcon.svg",
            onTapped: widget.onTapped,
            index: 1,
          ),
          verticalSpace(60),
          SideButton(
            text: "craftsmen",
            iconName: "assets/docs/craftsmenIcon.svg",
            onTapped: widget.onTapped,
            index: 2,
          ),
          verticalSpace(60),
          SideButton(
            text: "Categories",
            iconName: "assets/docs/CategoriesIcon.svg",
            onTapped: widget.onTapped,
            index: 3,
          ),
          verticalSpace(60),
          SideButton(
            text: "Tickets",
            iconName: "assets/docs/TicketsIcons.svg",
            onTapped: widget.onTapped,
            index: 4,
          ),
          verticalSpace(60),
          SideButton(
            text: "Admins",
            iconName: "assets/docs/AdminsIcon.svg",
            onTapped: widget.onTapped,
            index: 5,
          ),
          verticalSpace(60),
          SideButton(
            text: "Locations",
            iconName: "assets/docs/locationIcon.svg",
            onTapped: widget.onTapped,
            index: 6,
          ),
          verticalSpace(size.height * 0.4),
          if (size.width > 1300)
            SizedBox(
                width: size.width * 0.09,
                height: size.height * 0.07,
                child: SvgPicture.asset(
                  "assets/docs/fixrlogo.svg",
                  fit: BoxFit.cover,
                )),
        ],
      ),
    );
  }
}
