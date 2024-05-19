import 'package:d_chart/commons/data_model.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/craftsmen_chart_model.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/stores_chart_model.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/users_chart_model.dart';
import 'package:flutter/material.dart';

class DonutChartContainer extends StatelessWidget {
  const DonutChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1159,
      height: 300,
      // color: const Color.fromARGB(255, 128, 220, 232),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserChartModel(text:"Total users",number: "170",chartList: totalUsersList,),
          CraftsmenChartModel(text: "Total craftsmen", number: "123", chartList: totalCraftsmenList),
          StoreChartModel(text: "Total Stores", number: "100", chartList: totalStoresList)
         ],
        
      ),
    );
  }
}
List<OrdinalData> totalUsersList = [
    OrdinalData(domain: 'users', measure: 5, color: ColorManager.primary),
    OrdinalData(domain: 'New\nusers', measure: 3, color: ColorManager.babyBlue),
];
List<OrdinalData> totalCraftsmenList = [
    OrdinalData(domain: 'Accepted', measure: 5, color: ColorManager.primary),
    OrdinalData(domain: 'Pending', measure: 3, color: ColorManager.babyBlue),
];
List<OrdinalData> totalStoresList = [
    OrdinalData(domain: 'New\nStores', measure: 5, color: ColorManager.primary),
    OrdinalData(domain: 'Stores', measure: 3, color: ColorManager.babyBlue),
];