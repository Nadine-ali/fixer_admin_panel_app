import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class TableModel extends StatefulWidget {
  const TableModel({super.key});

  @override
  State<TableModel> createState() => _TableModelState();
}

class _TableModelState extends State<TableModel> {
  static const int numItems = 4; // Update to 4 rows

  final List<Map<String, String>> data = [
    {
      'name': 'Alice',
      'email': 'alice@example.com',
      'senderType': 'User',
      'messages': '5',
      'status': 'Active',
      'date': '2024-05-19',
    },
    {
      'name': 'Bob',
      'email': 'bob@example.com',
      'senderType': 'Admin',
      'messages': '12',
      'status': 'Inactive',
      'date': '2024-05-18',
    },
    {
      'name': 'Charlie',
      'email': 'charlie@example.com',
      'senderType': 'User',
      'messages': '7',
      'status': 'Active',
      'date': '2024-05-17',
    },
    {
      'name': 'David',
      'email': 'david@example.com',
      'senderType': 'Moderator',
      'messages': '3',
      'status': 'Pending',
      'date': '2024-05-16',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing:130,
        dataRowMinHeight: 30, // Minimum row height
        dataRowMaxHeight: 40,
        headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return ColorManager.primary;}),
        columns: 
        const <DataColumn>[
          DataColumn(
            label: Text('Name',style: TextStyle(color: ColorManager.white)),
          ),
          DataColumn(
            label: Text('Email',style: TextStyle(color: ColorManager.white)),
          ),
          DataColumn(
            label: Text('Sender Type',style: TextStyle(color: ColorManager.white)),
          ),
          DataColumn(
            label: Text('Messages',style: TextStyle(color: ColorManager.white)),
          ),
          DataColumn(
            label: Text('Status',style: TextStyle(color: ColorManager.white)),
          ),
          DataColumn(
            label: Text('Date',style: TextStyle(color: ColorManager.white)),
            
          ),
        ],
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              // Even rows will have a grey color.
              if (index.isEven) {
                return ColorManager.darkwhite;
              }
              else{
                return ColorManager.white;
              }// Use default value for other states and odd rows.
            }),
            cells: <DataCell>[
              DataCell(Text(data[index]['name']!)),
              DataCell(Text(data[index]['email']!)),
              DataCell(Text(data[index]['senderType']!)),
              DataCell(Text(data[index]['messages']!)),
              DataCell(Text(data[index]['status']!)),
              DataCell(Text(data[index]['date']!)),
            ],
          ),
        ),
      ),
    );
  }
}


