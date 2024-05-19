import 'dart:math';

import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/decorator.dart';
import 'package:d_chart/commons/enums.dart';
import 'package:d_chart/commons/style.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class StoreChartModel extends StatelessWidget {
  final List<OrdinalData> chartList;
  final String text;
  final String number;
  const StoreChartModel({super.key,required this.text,required this.number, required this.chartList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 290,
      decoration: BoxDecoration(color: ColorManager.white,
      borderRadius: BorderRadius.circular(15),
      ),
      child:Column(
        children: [
          Container(
            width: 140,
            height: 50,
            // color: Colors.amber,
            margin: const EdgeInsets.only(right: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(text,style: TextStyles.lightheadings.copyWith(fontSize: 16),),
              Text(number,style: TextStyles.normal.copyWith(color: ColorManager.primary),)
            ],),
          ),
          Container(
            height: 1,
            color: ColorManager.grey,
          ),
          verticalSpace(60),
          AspectRatio(
              aspectRatio: 21/9,
              child: DChartPieO(
                  data: chartList,
                  customLabel: (ordinalData, index) {
          return "${ordinalData.domain}:\n ${ordinalData.measure}";
        },
        configRenderPie: ConfigRenderPie(
          arcLabelDecorator: ArcLabelDecorator(
            labelPosition: ArcLabelPosition.outside,
            outsideLabelStyle: const LabelStyle(
              color: ColorManager.black,
              fontSize: 14,
            ),
            insideLabelStyle: const LabelStyle(
              color: ColorManager.black,
              fontSize: 14,
            ),
            labelPadding: 10,
            leaderLineStyle: const ArcLabelLeaderLineStyle(
              color: ColorManager.black,
              length: 15,
              thickness: 0.5,
            ),
            showLeaderLines: true,
          ),
          arcLength: 2 * pi,
          // arcRatio: 0.25,
          arcWidth: 15,
          startAngle: -pi / 2,
          strokeWidthPx: 2,
          arcRatio: 1
                ),
              ),
          ),
        ],
      ), 
    );
  }
}
