import 'package:d_chart/commons/data_model.dart';
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/manager/cubit/dashboard_cubit.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/charts_shimmer.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/craftsmen_chart_model.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/stores_chart_model.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/users_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonutChartContainer extends StatelessWidget {
  const DonutChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          DashboardCubit(getIt<DashBoardRepoImpl>())..getChartsData(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = DashboardCubit.get(context);
          if (cubit.charts != null) {
            return SizedBox(
              // color: Colors.amber,
                width: double.infinity,
                height: size.height * 0.35,
                child: size.width > 700
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          UserChartModel(
                            text: "Total users",
                            number: "170",
                            chartList: [
                              OrdinalData(
                                  domain: 'users',
                                  measure: cubit.charts!.clients!,
                                  color: ColorManager.primary),
                              OrdinalData(
                                  domain: 'New\nusers',
                                  measure: 1,
                                  color: ColorManager.babyBlue),
                            ],
                          ),
                          CraftsmenChartModel(
                              text: "Total craftsmen",
                              number: "123",
                              chartList: [
                                OrdinalData(
                                    domain: 'Craftsmen',
                                    measure: cubit.charts!.totalCraftsmen!,
                                    color: ColorManager.primary),
                                OrdinalData(
                                    domain: 'Pending\nCraftsmen ',
                                    measure: cubit.charts!.pendingCraftsmen!,
                                    color: ColorManager.babyBlue),
                              ]),
                          StoreChartModel(
                              text: "Total Stores",
                              number: "100",
                              chartList: [
                                OrdinalData(
                                    domain: 'New Stores',
                                    measure: 0,
                                    color: ColorManager.primary),
                                OrdinalData(
                                    domain: 'Stores',
                                    measure: cubit.charts!.stores!,
                                    color: ColorManager.babyBlue),
                              ])
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            UserChartModel(
                              text: "Total users",
                              number: "170",
                              chartList: [
                                OrdinalData(
                                    domain: 'Users',
                                    measure: cubit.charts!.clients!,
                                    color: ColorManager.primary),
                                OrdinalData(
                                    domain: 'New\nusers',
                                    measure: 1,
                                    color: ColorManager.babyBlue),
                              ],
                            ),
                            verticalSpace(20),
                            CraftsmenChartModel(
                                text: "Total craftsmen",
                                number: "123",
                                chartList: [
                                  OrdinalData(
                                      domain: 'Craftsmen',
                                      measure: cubit.charts!.totalCraftsmen!,
                                      color: ColorManager.primary),
                                  OrdinalData(
                                      domain: 'Pending\nCraftsmen ',
                                      measure: cubit.charts!.pendingCraftsmen!,
                                      color: ColorManager.babyBlue),
                                ]),
                            verticalSpace(20),
                            StoreChartModel(
                                text: "Total Stores",
                                number: "100",
                                chartList: [
                                  OrdinalData(
                                      domain: 'New Stores',
                                      measure: 1,
                                      color: ColorManager.primary),
                                  OrdinalData(
                                      domain: 'Stores',
                                      measure: cubit.charts!.stores!,
                                      color: ColorManager.babyBlue),
                                ])
                          ]));
          } else {
            return const ChartsShimmer();
          }
        },
      ),
    );
  }
}
