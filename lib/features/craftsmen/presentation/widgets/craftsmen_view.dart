import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/routing/app_router.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/repos/craftsmen_repo_imp.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/manager/cubit/crafts_men_cubit.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/presentation/widgets/crfatsman_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CraftsmenView extends StatelessWidget {
  const CraftsmenView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          CraftsMenCubit(getIt<CraftsmenRepoImpl>())..getCraftsmen(),
      child: BlocBuilder<CraftsMenCubit, CraftsMenState>(
        builder: (context, state) {
          CraftsMenCubit cubit = CraftsMenCubit.get(context);
          if (state is! CraftsMenLoading) {
            if (cubit.craftsmanList.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultButton(
                          onPressed: () {
                            cubit.getCraftsmen();
                          },
                          text: "Refresh",
                          size: size),
                      verticalSpace(70),
                      DataTable(
                        headingRowHeight: size.height * 0.05,
                        columnSpacing: size.width * 0.1,
                        dataRowMinHeight: size.height * 0.03,
                        headingRowColor:
                            WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                          return ColorManager.primary;
                        }),
                        columns: <DataColumn>[
                          const DataColumn(
                            label: Text('Name',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: ColorManager.white)),
                          ),
                          const DataColumn(
                            label: Text('User Name',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: ColorManager.white)),
                          ),
                          const DataColumn(
                            label: Text('Email',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: ColorManager.white)),
                          ),
                          if (size.width > 1200)
                            const DataColumn(
                              label: Text('Phone Number',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: ColorManager.white)),
                            ),
                        ],
                        rows: List<DataRow>.generate(
                          cubit.craftsmanList.length,
                          (int index) => DataRow(
                            color: WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                              if (index.isEven) {
                                return ColorManager.darkwhite;
                              } else {
                                return ColorManager.white;
                              }
                            }),
                            cells: <DataCell>[
                              DataCell(Text(
                                cubit.craftsmanList[index].name!,
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                cubit.craftsmanList[index].username!,
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                cubit.craftsmanList[index].email!,
                                overflow: TextOverflow.ellipsis,
                              )),
                              if (size.width > 1200)
                                DataCell(Text(
                                  cubit.craftsmanList[index].phone!,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            ],
                            onLongPress: () {
                              navigateTo(
                                  context,
                                  CraftsmanDetails(
                                    model: cubit.craftsmanList[index],
                                  ));
                            },
                          ),
                        ),
                      ),
                      verticalSpace(50),
                      Text(
                        "Long press on a row to view details of a craftsman !",
                        style: TextStyles.headings,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  defaultButton(
                      onPressed: () {
                        cubit.getCraftsmen();
                      },
                      text: "Refresh",
                      size: size),
                  verticalSpace(70),
                  Center(
                    child: Text(
                      "No Pending Apps !",
                      style: TextStyles.headings,
                    ),
                  ),
                ],
              );
            }
          } else {
            if (cubit.craftsmanList.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(70),
                      const TableShimmer(
                        count: 18,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No Pending Apps !",
                  style: TextStyles.headings,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
