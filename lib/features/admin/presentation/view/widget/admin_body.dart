import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/admin/manager/cubit/admin_cubit.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/admin_card_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/edit_form.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/shimmer_admin_card.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBody extends StatefulWidget {
  const AdminBody({super.key});

  @override
  State<AdminBody> createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  bool _showEditEntryForm = false;
  bool _showUserProfile = false;
  AdminModel? _selectedAdmin;

  void _toggleEditEntryForm() {
    setState(() {
      _showEditEntryForm = !_showEditEntryForm;
      if (_showEditEntryForm) {
        _showUserProfile = false;
      }
    });
  }

  void _toggleProfileView(AdminModel admin) {
    setState(() {
      _selectedAdmin = admin;
      _showUserProfile = !_showUserProfile;
      if (_showUserProfile) {
        _showEditEntryForm = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_showEditEntryForm) {
      return EditInfoForm(
        onCancel: _toggleEditEntryForm,
        toggleProfileView: _toggleProfileView,
      );
    } else if (_showUserProfile && _selectedAdmin != null) {
      return UserProfile(
        admin: _selectedAdmin!,
        onCancel: () => _toggleProfileView(_selectedAdmin!),
        toggleEditForm: _toggleEditEntryForm,
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: _toggleEditEntryForm,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorManager.primary,
                    ),
                    child: Center(
                      child: Text(
                        "Add user",
                        style: TextStyles.normal
                            .copyWith(color: ColorManager.white),
                      ),
                    ),
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
                      crossAxisCount: size.width > 1300 ? 3 : 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: cubit.admins.isNotEmpty
                          ? cubit.admins.map((admin) {
                              return AdminCardModel(
                                admin: admin,
                                toggleEditForm: _toggleEditEntryForm,
                                toggleProfileView: () =>
                                    _toggleProfileView(admin),
                              );
                            }).toList()
                          : List.generate(
                              6,
                              (index) => const ShimmerAdminCard(),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
