import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/manager/cubit/admin_cubit.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/admin_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminsScreen extends StatefulWidget {
  const AdminsScreen({
    super.key,
  });

  @override
  State<AdminsScreen> createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<AdminsScreen> {
  bool _showEditEntryForm = false;
  bool _showUserProfile = false;

  void _toggleEditEntryForm() {
    setState(() {
      _showEditEntryForm = !_showEditEntryForm;
      if (_showEditEntryForm) {
        _showUserProfile = false;
      }
    });
  }

  void _toggleProfileView() {
    setState(() {
      _showUserProfile = !_showUserProfile;
      if (_showUserProfile) {
        _showEditEntryForm = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 1159,
      height: 565,
      color: ColorManager.darkwhite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: Container(
        width: 1159,
        height: 565,
        color: ColorManager.darkwhite,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 149,
                height: 42,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 1000),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 20,
                      color: ColorManager.white,
                    ),
                    Text(
                      "Add user",
                      style:
                          TextStyles.normal.copyWith(color: ColorManager.white),
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(50),
            BlocBuilder<AdminCubit, AdminState>(
              builder: (context, state) {
                AdminCubit cubit = AdminCubit.get(context);
                return SizedBox(
                    height: size.height * 0.7,
                    width: double.infinity,
                    child: GridView.count(
                      childAspectRatio: 12 / 4,
                      crossAxisCount: size.width > 1450
                          ? 4
                          : size.width > 1300
                              ? 3
                              : 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: cubit.admins.isNotEmpty
                          ? cubit.admins.map((admin) {
                              return AdminCardModel(
                                admin: admin,
                                toggleEditForm: _toggleEditEntryForm,
                                toggleProfileView: _toggleProfileView,
                              );
                            }).toList()
                          : <Widget>[
                              Center(
                                child: Text(
                                  "No Admins",
                                  style: TextStyles.normal,
                                ),
                              )
                            ],
                    ));
              },
            ),
            BlocBuilder<AdminCubit, AdminState>(
              builder: (context, state) {
                AdminCubit cubit = AdminCubit.get(context);
                return SizedBox(
                    height: size.height * 0.7,
                    width: double.infinity,
                    child: GridView.count(
                      childAspectRatio: 12 / 4,
                      crossAxisCount: size.width > 1450
                          ? 4
                          : size.width > 1300
                              ? 3
                              : 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: cubit.admins.isNotEmpty
                          ? cubit.admins.map((admin) {
                              return AdminCardModel(
                                admin: admin,
                                toggleEditForm: _toggleEditEntryForm,
                                toggleProfileView: _toggleProfileView,
                              );
                            }).toList()
                          : <Widget>[
                              Center(
                                child: Text(
                                  "No Admins",
                                  style: TextStyles.normal,
                                ),
                              )
                            ],
                    ));
              },
            ),
          ],
        ),
      )),
    );
  }
}
