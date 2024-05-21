import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/add_store.dart';
import 'package:flutter/material.dart';

String storePage = "Stores";

class StroeView extends StatefulWidget {
  const StroeView({super.key});

  @override
  State<StroeView> createState() => _StroeViewState();
}

class _StroeViewState extends State<StroeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return storePage == "Stores"
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          storePage = "Add Store";
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorManager.primary,
                        ),
                        child: Center(
                          child: Text(
                            "Add Store",
                            style: TextStyles.normal
                                .copyWith(color: ColorManager.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  DataTable(
                    columnSpacing: size.width * 0.2,
                    dataRowMinHeight: size.height * 0.05,
                    headingRowColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return ColorManager.primary;
                    }),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Store Name',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ColorManager.white)),
                      ),
                      DataColumn(
                        label: Text('Location',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ColorManager.white)),
                      ),
                      DataColumn(
                        label: Text('Item Count',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ColorManager.white)),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      10,
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
                        cells: const <DataCell>[
                          DataCell(Text(
                            "nameeee",
                            overflow: TextOverflow.ellipsis,
                          )),
                          DataCell(Text(
                            "location",
                            overflow: TextOverflow.ellipsis,
                          )),
                          DataCell(Text(
                            "items",
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : AddStore(
            onCancel: () {
              setState(() {
                storePage = "Stores";
              });
            },
            onContinue: () {
              setState(() {
                storePage = "Stores";
              });
            },
          );
  }
}
