import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/categories/data/repos/categories_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/categories/manager/cubit/categories_cubit.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/text_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController serviceDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _selected;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CategoriesCubit(getIt<CategoriesRepoImpl>()),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) => Form(
          key: formKey,
          child: Container(
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
                    child: Text(
                      "Add Category",
                      style: TextStyles.boldheadings.copyWith(fontSize: 12.sp),
                    )),
                verticalSpace(50),
                Text(
                  'Service Name',
                  style: TextStyles.normal,
                ),
                verticalSpace(5),
                TextFormFieldModel(
                    controller: serviceNameController,
                    text: 'Enter service name',
                    horiPadding: 16.0,
                    vertpadding: 0),
                verticalSpace(20),
                Text(
                  'Service Price',
                  style: TextStyles.normal,
                ),
                verticalSpace(5),
                TextFormFieldModel(
                    controller: servicePriceController,
                    text: 'Enter service price',
                    horiPadding: 16.0,
                    vertpadding: 0),
                verticalSpace(20),
                Text(
                  'Service Description',
                  style: TextStyles.normal,
                ),
                verticalSpace(5),
                Container(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: ColorManager.grey), // optional border
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      border: InputBorder.none,
                      hintText: 'choose Category',
                    ),
                    value: _selected,
                    items: const [
                      DropdownMenuItem(
                        value: 'plumbing',
                        child: Text('plumbing'),
                      ),
                      DropdownMenuItem(
                        value: 'electrical',
                        child: Text('electrical'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selected = newValue;
                      });
                    },
                  ),
                ),
                verticalSpace(100),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  defaultButton(
                    onPressed: widget.oncancel,
                    text: "Cancel",
                    size: widget.size,
                    width: widget.size.width * 0.05,
                    hasEdges: true,
                    height: widget.size.height * 0.045,
                  ),
                  horizontalSpace(15),
                  if (state is AddServiceLoading)
                    const CircularProgressIndicator(),
                  if (state is! AddServiceLoading)
                    defaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            _selected != null) {
                          CategoriesCubit.get(context).addService(
                              serviceNameController.text,
                              int.parse(servicePriceController.text),
                              _selected!,
                              context);
                        } else if (_selected == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a category'),
                            ),
                          );
                        }
                      },
                      text: "Add",
                      size: widget.size,
                      width: widget.size.width * 0.05,
                      hasEdges: false,
                      height: widget.size.height * 0.045,
                    )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
