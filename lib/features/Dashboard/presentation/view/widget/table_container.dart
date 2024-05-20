import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/manager/cubit/dashboard_cubit.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableContainer extends StatelessWidget {
  const TableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          DashboardCubit(getIt<DashBoardRepoImpl>())..getDashboardData(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
            return SizedBox(
              width: size.width * 0.8,
              height: DashboardCubit.get(context).messages.length * 120 + 400,
              child: size.width < 1050
                  ? Column(
                      children: [
                        if (size.width > 700) verticalSpace(20),
                        if (size.width > 700)
                          Text("View Tickets",
                              style: TextStyles.headings.copyWith(
                                  color: ColorManager.primary,
                                  decoration: TextDecoration.underline)),
                      ],
                    )
                  : Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Column(
                        children: [
                          verticalSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Recent Tickets",
                                  style: TextStyles.normal
                                      .copyWith(color: ColorManager.primary)),
                              Text("View All",
                                  style: TextStyles.normal.copyWith(
                                      color: ColorManager.primary,
                                      decoration: TextDecoration.underline)),
                            ],
                          ),
                          verticalSpace(50),
                          const TableModel()
                        ],
                      ),
                    ),
            );
        },
      ),
    );
  }
}
