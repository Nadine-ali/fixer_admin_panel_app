import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/text_form_field_model.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStore extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onContinue;

  const AddStore({
    super.key,
    required this.onCancel,
    required this.onContinue,
  });

  @override
  State<AddStore> createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              width: size.width * 0.45,
              height: size.height * 0.75,
              color: ColorManager.darkwhite,
              child: Center(
                child: Container(
                  width: size.width * 0.55,
                  height: size.height * 0.75,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // shadow color
                        spreadRadius: 3, // spread radius
                        blurRadius: 7, // blur radius
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: ColorManager.white,
                  ),
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.4,
                        height: size.height * 0.65,
                        padding: const EdgeInsets.all(12),
                        color: ColorManager.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Add Store",
                              style: TextStyles.headings,
                            ),
                            verticalSpace(90),
                            TextFieldModel(
                              width: size.width * 0.3,
                              text: "Store Name",
                              controller: nameController,
                            ),
                            verticalSpace(50),
                            TextFieldModel(
                              width: size.width * 0.3,
                              text: "Store Location",
                              controller: locationController,
                            ),
                            verticalSpace(50),
                            TextFieldModel(
                              width: size.width * 0.3,
                              text: "Store Phone number",
                              controller: phoneController,
                            ),
                            verticalSpace(50),
                            TextFieldModel(
                              width: size.width * 0.3,
                              text: "Store Description",
                              controller: descriptionController,
                            ),
                            verticalSpace(80),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                defaultButton(
                                  onPressed: widget.onCancel,
                                  text: "Cancel",
                                  size: size,
                                  width: size.width * 0.05,
                                  hasEdges: true,
                                  height: size.height * 0.045,
                                ),
                                const SizedBox(width: 16.0),
                                if (state is StoresLoading)
                                  const CircularProgressIndicator(),
                                if (state is! StoresLoading)
                                  defaultButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        StoresCubit.get(context)
                                            .addStore(
                                          nameController.text,
                                          locationController.text,
                                          descriptionController.text,
                                          phoneController.text,
                                        )
                                            .then((value) {
                                          widget.onContinue();
                                        });
                                      }
                                    },
                                    text: "Edit",
                                    size: size,
                                    width: size.width * 0.05,
                                    hasEdges: false,
                                    height: size.height * 0.045,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
