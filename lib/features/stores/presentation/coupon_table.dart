// ignore_for_file: deprecated_member_use
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/copoun_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponTable extends StatefulWidget {
  final List<CopounModel> coupons;
  const CouponTable({
    super.key,
    required this.coupons,
  });

  @override
  State<CouponTable> createState() => _CouponTableState();
}

class _CouponTableState extends State<CouponTable> {
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
                'Code',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            DataColumn(
              label: Text(
                'Date Created',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            DataColumn(
              label: Text(
                'Expiration Date',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            DataColumn(
              label: Text(
                'value',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            widget.coupons.length,
            (int index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (index.isEven) {
                    return ColorManager.white;
                  }
                  return ColorManager.darkwhite;
                },
              ),
              cells: <DataCell>[
                DataCell(Text(widget.coupons[index].code.toString())),
                DataCell(Text(widget.coupons[index].dateCreated!)),
                DataCell(Text(widget.coupons[index].expDate.toString())),
                DataCell(Text(widget.coupons[index].value.toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
