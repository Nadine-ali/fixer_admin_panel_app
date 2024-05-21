import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/features/admin/data/repos/admin_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/admin/manager/cubit/admin_cubit.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/admin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminView extends StatelessWidget {
  static const String routeName = "adminView";
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdminCubit(getIt<AdminRepoImpl>())..getAdmins(),
        child: const AdminBody());
  }
}
