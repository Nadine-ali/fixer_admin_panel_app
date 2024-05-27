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
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserChartModel extends StatelessWidget {
  final List<OrdinalData> chartList;
  final String text;
  final String number;

  const UserChartModel({
    super.key,
    required this.text,
    required this.number,
    required this.chartList,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 175.w,
      height: 550.h,
      // width: size.width * 0.25,
      // height: size.height * 0.25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.25,
            height: size.height * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (size.height > 700 && size.width > 700)
                    Text(
                      text,
                      style: TextStyles.lightheadings.copyWith(fontSize: 16),
                    ),
                  if (size.height > 700 && size.width > 700)
                    Text(
                      number,
                      style: TextStyles.normal
                          .copyWith(color: ColorManager.primary),
                    )
                ],
              ),
            ),
          ),
          if (size.height > 700 && size.width > 700)
            Container(
              height: 0.5,
              color: ColorManager.grey,
            ),
          if (size.height > 700 && size.width > 700) verticalSpace(25),
          AspectRatio(
            aspectRatio: size.width > 1050 ? 33 / 17 : 30 / 13,
            child: DChartPieO(
              data: chartList,
              customLabel: (ordinalData, index) {
                return "${ordinalData.domain}:\n${ordinalData.measure}";
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
                      color: ColorManager.grey,
                      length: 18,
                      thickness: 0.5,
                    ),
                    showLeaderLines: true,
                  ),
                  arcLength: 2 * pi,
                  // arcRatio: 0.25,
                  arcWidth: 15,
                  startAngle: -pi / 2,
                  strokeWidthPx: 2,
                  arcRatio: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
