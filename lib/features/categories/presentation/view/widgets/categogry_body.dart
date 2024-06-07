import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/add_service_form.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/category_card_model.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/servicetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  bool _showServiceAddForm = false;
  bool _showServiceTable = false;

  void _toggleServiceAddForm() {
    setState(() {
      _showServiceAddForm = !_showServiceAddForm;
      if (_showServiceAddForm) {
        _showServiceTable = false;
      }
    });
  }

  void _toggleServiceTable() {
    setState(() {
      _showServiceTable = !_showServiceTable;
      if (_showServiceTable) {
        _showServiceAddForm = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_showServiceAddForm) {
      return AddServiceForm(
        oncancel: _toggleServiceAddForm,
        size: size,
      );
    } else {
      return SizedBox(
        width: 600.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All Categories",
                style: TextStyles.headings.copyWith(fontSize: 14.sp)),
            verticalSpace(70),
            Row(
              children: [
                CategoryCardModel(
             id: 16,
                
                  text: "Electrical",
                  serviceimage: "assets/images/electricalPic.png",
                  toggleAddForm: _toggleServiceAddForm,
                  size: size,
                ),
                horizontalSpace(15),
                CategoryCardModel(
                  id:14,
                
                  text: "Plumbing",
                  serviceimage: "assets/images/plumbingPic.png",
                  toggleAddForm: _toggleServiceAddForm,
                  size: size,
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
