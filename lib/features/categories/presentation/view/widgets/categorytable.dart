// ignore_for_file: deprecated_member_use
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/categories/data/models/service_model/service_model.dart';
import 'package:fixer_admin_panel_app/features/categories/manager/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTable extends StatefulWidget {
  final List<ServiceModel> services;
  const CategoryTable({
    super.key,
    required this.services,
  });

  @override
  State<CategoryTable> createState() => _CategoryTableState();
}

class _CategoryTableState extends State<CategoryTable> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) => SizedBox(
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
                onLongPress: () {
                  CategoriesCubit.get(context)
                      .deleteService(widget.services[index].id!, context);
                  //are you sure you want to delete
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => AlertDialog(
                  //           title: Text(
                  //               "Are you sure you want to delete ${widget.services[index].name}?"),
                  //           actions: [
                  //             defaultButton(
                  //                 onPressed: () {
                  //                   Navigator.pop(context);
                  //                 },
                  //                 text: "Cancel",
                  //                 size: size,
                  //                 hasEdges: true,
                  //                 width: 100),
                  //             if (state is DeleteServiceLoading)
                  //               const CircularProgressIndicator(),
                  //             if (state is! DeleteServiceLoading)
                  //               defaultButton(
                  //                   onPressed: () {

                  //                   },
                  //                   text: "Delete",
                  //                   size: size,
                  //                   width: 100),
                  //           ],
                  //         ));
                },
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
      ),
    );
  }
}
