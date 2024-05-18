import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height:115 ,
      width: MediaQuery.sizeOf(context).width,
      // color: Color.fromARGB(255, 158, 65, 65),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // color: Colors.amber,
          margin: const EdgeInsets.only(left: 30),
          child: Text("Dashboard/Home",style:TextStyles.headings ,),
        ),
        Container(
          width: 313,
          height:41,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          suffixIcon: Container(
            height: 41,
            width: 36,
            decoration: const BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    )
        ,
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(color: ColorManager.grey,borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.person_rounded,size: 50,color: ColorManager.primary300,)),
              const Icon(Icons.keyboard_arrow_down_rounded,size: 35,)
            ],
          ),
        ),
        
                      ],
                    ),
                  );
  }
}