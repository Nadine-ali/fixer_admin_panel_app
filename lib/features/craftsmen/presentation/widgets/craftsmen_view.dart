import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CraftsmenView extends StatelessWidget {
  const CraftsmenView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(70),
            //  const TableShimmer(
            //     count: 18,
            //   ),
            DataTable(
              headingRowHeight: size.height * 0.05,
              columnSpacing: size.width * 0.1,
              dataRowMinHeight: size.height * 0.03,
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
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
                20,
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
                      "vebeeb ",
                      overflow: TextOverflow.ellipsis,
                    )),
                    DataCell(Text(
                      "svsbabed",
                      overflow: TextOverflow.ellipsis,
                    )),
                    DataCell(Text(
                      "basenbksbnrljk",
                      overflow: TextOverflow.ellipsis,
                    )),
                    if (size.width > 1200)
                      DataCell(Text(
                        "sbnkwebnwlbnekl",
                        overflow: TextOverflow.ellipsis,
                      )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
