import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/buttons_model.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/gendre_drop_down_menu.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/text_form_field_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class EditInfoForm extends StatefulWidget {
  final VoidCallback onCancel;
  const EditInfoForm({super.key, required this.onCancel});

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
    return Container(
      width: 1159,
      height: 565,
      color: ColorManager.darkwhite,
      child: Center(
        child: Container(
          width: 900,
          height: 687,
          decoration: BoxDecoration(
            boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // shadow color
                  spreadRadius: 3, // spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            borderRadius: BorderRadius.circular(30),color: ColorManager.white,),
          padding: const EdgeInsets.all(30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 118,
                height: 118,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),color: const Color.fromARGB(255, 129, 127, 127)),
                child: SvgPicture.asset("assets/docs/defaultProfilePic.svg",fit: BoxFit.cover,height: 118,width: 118,),
              ),
              horizontalSpace(20),
              Container(
                width: 556,
                height: 582,
                padding: const EdgeInsets.all(12),
                color: ColorManager.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFieldModel(width: 270,text:"First name",controller: firstNameController,),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: TextFieldModel(width: 270,text: "Last name",controller: lastNameController,),
                        ),
                      ],
                    ),
                    TextFieldModel(width: 555,text: "Username",controller: usernameController,),
                    TextFieldModel(width: 555,text:"Phone",controller: phoneController,),
                    TextFieldModel(width: 555,text:"email",controller: emailController,),
                    TextFieldModel(width: 555,text: "role",controller: roleController,),
                    const GenderDropDownMenu(text:"Gender",),
                    verticalSpace(90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CancelButton( onCancel: widget.onCancel),
                        const SizedBox(width: 16.0),
                        const AddButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


