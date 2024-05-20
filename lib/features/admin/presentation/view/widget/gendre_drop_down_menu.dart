import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class GenderDropDownMenu extends StatefulWidget {
  final String text;
  const GenderDropDownMenu({super.key, required this.text});

  @override
  State<GenderDropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<GenderDropDownMenu> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyles.normal.copyWith(fontWeight: FontWeight.w500),
        ),
        Container(
          width: 555,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.grey), // optional border
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
              hintText: 'Gender',
            ),
            value: _selectedGender,
            items: const [
              DropdownMenuItem(
                value: 'Female',
                child: Text('Female'),
              ),
              DropdownMenuItem(
                value: 'Male',
                child: Text('Male'),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                _selectedGender = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}