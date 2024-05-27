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
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyles.normal.copyWith(fontWeight: FontWeight.w500),
        ),
        Container(
          width: size.width * 0.4,
          height: size.height * 0.045,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.grey), // optional border
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:12),
              border: InputBorder.none,
              hintText: 'choose Role',
            ),
            value: _selectedGender,
            items: const [
              DropdownMenuItem(
                value: 'frontend',
                child: Text('Frontend'),
              ),
              DropdownMenuItem(
                value: 'backend',
                child: Text('backend'),
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
