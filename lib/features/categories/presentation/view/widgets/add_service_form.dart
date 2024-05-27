import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/text_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddServiceForm extends StatefulWidget {
  final VoidCallback oncancel;
  final Size size;
  const AddServiceForm({super.key, required this.size, required this.oncancel});

  @override
  State<AddServiceForm> createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController servicePriceController = TextEditingController();
  final TextEditingController serviceDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
    width: 400.w,
    height: 1000.h,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text("Add Category",style: TextStyles.boldheadings.copyWith(fontSize:12.sp),)),
        verticalSpace(50),  
        Text('Service Name',style: TextStyles.normal,),
        verticalSpace(5),
        TextFormFieldModel(controller: serviceNameController, text: 'Enter service name', horiPadding: 16.0, vertpadding: 0),
        verticalSpace(20),
        Text('Service Price',style: TextStyles.normal,),
        verticalSpace(5),
        TextFormFieldModel(controller: servicePriceController, text: 'Enter service price', horiPadding: 16.0, vertpadding: 0),
        verticalSpace(20),
        Text('Service Description',style: TextStyles.normal,),
        verticalSpace(5),
        TextFormFieldModel(controller: serviceDescriptionController, text: 'Write a small description about the service', horiPadding: 16.0, vertpadding:60),
        verticalSpace(100),
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
      children: [
        defaultButton(
        onPressed:widget.oncancel,
        text: "Cancel",
        size: widget.size,
        width: widget.size.width * 0.05,
        hasEdges: true,
        height: widget.size.height * 0.045,),
      horizontalSpace(15),
      defaultButton(
      onPressed:(){},
      text: "Add",
      size: widget.size,
      width: widget.size.width * 0.05,
      hasEdges: false,
      height: widget.size.height * 0.045,)
      ]
       ),
      ],
    ),
         );
  }
}
      
                   
      
  