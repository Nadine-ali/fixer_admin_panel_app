import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/manager/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableModel extends StatefulWidget {
  const TableModel({super.key});

  @override
  State<TableModel> createState() => _TableModelState();
}

class _TableModelState extends State<TableModel> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);
        Size size = MediaQuery.of(context).size;
        if (state is! DashboardLoading) {
          return SingleChildScrollView(
            child: DataTable(
              columnSpacing: size.width * 0.1,
              dataRowMinHeight: size.height * 0.03,
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return ColorManager.primary;
              }),
              columns: <DataColumn>[
                const DataColumn(
                  label: Text('User ID',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: ColorManager.white)),
                ),
                const DataColumn(
                  label: Text('Email',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: ColorManager.white)),
                ),
                const DataColumn(
                  label: Text('Sender Type',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: ColorManager.white)),
                ),
                if (size.width > 1200)
                  const DataColumn(
                    label: Text('Message',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: ColorManager.white)),
                  ),
              ],
              rows: List<DataRow>.generate(
                cubit.messages.length,
                (int index) => DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    // Even rows will have a grey color.
                    if (index.isEven) {
                      return ColorManager.darkwhite;
                    } else {
                      return ColorManager.white;
                    } // Use default value for other states and odd rows.
                  }),
                  cells: <DataCell>[
                    DataCell(Text(
                      cubit.messages[index].userId.toString(),
                      overflow: TextOverflow.ellipsis,
                    )),
                    DataCell(Text(
                      cubit.messages[index].contactEmail!,
                      overflow: TextOverflow.ellipsis,
                    )),
                    DataCell(Text(
                      cubit.messages[index].userType!,
                      overflow: TextOverflow.ellipsis,
                    )),
                    if (size.width > 1200)
                      DataCell(Text(
                        cubit.messages[index].messageDetail!,
                        overflow: TextOverflow.ellipsis,
                      )),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
