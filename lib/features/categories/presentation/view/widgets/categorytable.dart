import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTable extends StatefulWidget {
  @override
  State<CategoryTable> createState() => _CategoryTableState();
}

class _CategoryTableState extends State<CategoryTable> {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Electrical Wiring',
      'price': '\$100',
      'description': 'Installation and repair of electrical systems.'
    },
    {
      'name': 'Plumbing',
      'price': '\$80',
      'description': 'Fixing leaks and installing new plumbing systems.'
    },
    {
      'name': 'Carpentry',
      'price': '\$150',
      'description': 'Building and repairing wooden structures.'
    },
    {
      'name': 'Painting',
      'price': '\$120',
      'description': 'Professional painting services for homes and offices.'
    },
    {
      'name': 'Cleaning',
      'price': '\$60',
      'description': 'Comprehensive cleaning services.'
    },
  ];

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
            DataColumn(
              label: Text(
                'Service Description',
                style: TextStyle(color: ColorManager.white),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            services.length,
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
                DataCell(Text(services[index]['name'])),
                DataCell(Text(services[index]['price'])),
                DataCell(Text(services[index]['description'])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
