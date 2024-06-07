import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/routing/app_router.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/categories/data/models/service_model/service_model.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/category_buttons.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/servicetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardModel extends StatelessWidget {
  final String serviceimage;
  final String text;
  final VoidCallback toggleAddForm;
  final Size size;
  final int id;
  const CategoryCardModel({
    super.key,
    required this.serviceimage,
    required this.text,
    required this.toggleAddForm,
    required this.size,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130.w,
        height: 500.h,
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 280.w,
                  height: 280.h,
                  child: Image.asset(
                    serviceimage,
                    fit: BoxFit.contain,
                  )),
              verticalSpace(15),
              Text(
                text,
                style: TextStyles.headings,
              ),
              verticalSpace(40),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ServiceButton(
                  color: ColorManager.white,
                  borderColor: ColorManager.primary,
                  text: "View Services",
                  textColor: ColorManager.primary,
                  onpressed: () {
                    navigateTo(
                        context,
                        ServicesScreen(
                          id: id,
                          size: size,
                          category: text,
                        ));
                  },
                  hasEdges: true,
                  size: size,
                ),
                ServiceButton(
                  color: ColorManager.primary,
                  borderColor: ColorManager.primary,
                  text: "Add Service",
                  textColor: const Color.fromARGB(255, 45, 1, 1),
                  onpressed: toggleAddForm,
                  hasEdges: false,
                  size: size,
                )
              ])
            ]));
  }
}
