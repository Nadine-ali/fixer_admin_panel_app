// ignore_for_file: deprecated_member_use

import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/categories/data/models/service_model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTable extends StatefulWidget {
  final List<ServiceModel> services;
  const CategoryTable({super.key, required this.services});

  @override
  State<CategoryTable> createState() => _CategoryTableState();
}

class _CategoryTableState extends State<CategoryTable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.w,
      child: SingleChildScrollView(
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(ColorManager.primary),
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Service id',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            DataColumn(
              label: Text(
                'Service Name',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            DataColumn(
              label: Text(
                'Service Price',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            widget.services.length,
            (int index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  // Even rows will have a grey color.
                  if (index.isEven) {
                    return ColorManager.white;
                  }
                  return ColorManager
                      .darkwhite; // Use white color for odd rows.
                },
              ),
              cells: <DataCell>[
                DataCell(Text(widget.services[index].id.toString())),
                DataCell(Text(widget.services[index].name!)),
                DataCell(Text(widget.services[index].price.toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
