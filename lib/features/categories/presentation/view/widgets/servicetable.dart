import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/categorytable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceTable extends StatelessWidget {
  final VoidCallback toggleServiceAddForm;
  final Size size;
  const ServiceTable(
      {super.key, required this.toggleServiceAddForm, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          defaultButton(
            onPressed: toggleServiceAddForm,
            text: "Add new service",
            size: size,
            width: 90.w,
            hasEdges: false,
            height: 81.h,
          ),
          verticalSpace(50),
          CategoryTable()
        ],
      ),
    );
  }
}
