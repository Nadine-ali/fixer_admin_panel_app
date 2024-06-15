import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/image_upload_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/number_field_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/text_form_field_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItem extends StatefulWidget {
  final String storeName;
  const AddItem({
    super.key,
    required this.storeName,
  });

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => StoresCubit(getIt<StoresRepoImpl>()),
      child: BlocBuilder<StoresCubit, StoresState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Add Item",
                style: TextStyles.headings,
              ),
              backgroundColor: ColorManager.white,
              elevation: 0,
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
                  child: Center(
                    child: Container(
                      width: size.width * 0.45,
                      height: size.height * 0.8,
                      color: ColorManager.darkwhite,
                      child: Center(
                        child: Container(
                          width: size.width * 0.55,
                          height: size.height * 0.8,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // shadow color
                                spreadRadius: 3, // spread radius
                                blurRadius: 7, // blur radius
                                offset: const Offset(
                                    0, 3), // changes position of shadow
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
                                      "Add Item",
                                      style: TextStyles.headings,
                                    ),
                                    verticalSpace(90),
                                    TextFieldModel(
                                      width: size.width * 0.3,
                                      text: "Item Name",
                                      controller: nameController,
                                    ),
                                    verticalSpace(50),
                                    NumberFieldModel(
                                      width: size.width * 0.3,
                                      text: "Item Price",
                                      controller: priceController,
                                    ),
                                    verticalSpace(50),
                                    NumberFieldModel(
                                      width: size.width * 0.3,
                                      text: "Item Quantity",
                                      controller: quantityController,
                                    ),
                                    verticalSpace(80),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        defaultButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          text: "Cancel",
                                          size: size,
                                          width: size.width * 0.05,
                                          hasEdges: true,
                                          height: size.height * 0.045,
                                        ),
                                        const SizedBox(width: 16.0),
                                        if (state is AddItemLoading)
                                          const CircularProgressIndicator(),
                                        if (state is! AddItemLoading)
                                          defaultButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                      .validate() &&
                                                  int.tryParse(
                                                          quantityController
                                                              .text) !=
                                                      null) {
                                                StoresCubit.get(context)
                                                    .addItem(
                                                        nameController.text,
                                                        priceController.text,
                                                        int.parse(
                                                            quantityController
                                                                .text),
                                                        widget.storeName)
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                });
                                              }
                                            },
                                            text: "Add",
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
