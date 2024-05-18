import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 236,
      height: 100,
      // color: Colors.amber,
      child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [  
      Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(color: ColorManager.grey,borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.person_rounded,size: 50,color: ColorManager.primary300,)),
        horizontalSpace(15),
      Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,  
      children: [
      Text("Admin",style: TextStyles.normal,),
      Text("sama",style: TextStyles.normal,),
                        ],
                      )
                    ],
                  ),
    );
  }
}