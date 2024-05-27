import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/role_drop_down_menu.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/text_form_field_model.dart';
import 'package:flutter/material.dart';

class EditInfoForm extends StatefulWidget {
  final VoidCallback onCancel;
  final void Function(AdminModel) toggleProfileView;

  const EditInfoForm({
    super.key,
    required this.onCancel,
    required this.toggleProfileView,
  });

  @override
  State<EditInfoForm> createState() => _EditInfoFormState();
}

class _EditInfoFormState extends State<EditInfoForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
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
                  offset: const Offset(0, 3), // changes position of shadow
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
                  height: size.height * 0.75,
                  padding: const EdgeInsets.all(12),
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFieldModel(
                              width: size.width * 0.2,
                              text: "First name",
                              controller: firstNameController,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: TextFieldModel(
                              width: size.width * 0.2,
                              text: "Last name",
                              controller: lastNameController,
                            ),
                          ),
                        ],
                      ),
                      TextFieldModel(
                        width: size.width * 0.4,
                        text: "Username",
                        controller: usernameController,
                      ),
                      TextFieldModel(
                        width: size.width * 0.4,
                        text: "Phone",
                        controller: phoneController,
                      ),
                      TextFieldModel(
                        width: size.width * 0.4,
                        text: "email",
                        controller: emailController,
                      ),
                      const GenderDropDownMenu(
                        text: "Role",
                      ),
                      verticalSpace(90),
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
                          defaultButton(
                            onPressed: () {
                              // Example of creating an AdminModel. This should be adjusted based on your actual model's structure.
                              AdminModel admin = AdminModel(
                                name: firstNameController.text,
                                username: usernameController.text,
                                email: emailController.text,
                                role: roleController.text,
                              );
                              widget.toggleProfileView(admin);
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
    );
  }
}
