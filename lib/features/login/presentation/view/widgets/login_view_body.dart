import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/login/presentation/view/widgets/login_view_body_buttons.dart';
import 'package:fixer_admin_panel_app/features/login/presentation/view/widgets/login_view_body_text_container.dart';
import 'package:fixer_admin_panel_app/features/login/presentation/view/widgets/login_view_body_text_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(left: 30), children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            Container(
              margin: EdgeInsets.only(right: 100.w, bottom: 60),
              child: Text(
                "Welcome\nBack!",
                textAlign: TextAlign.justify,
                style: TextStyles.boldheadings,
              ),
            ),
            const TextContainer(
              text: "Phone number",
              marginRight: 200,
            ),
            verticalSpace(5), //EMAIL INPUT
            TextForm(
                controller: phoneController,
                text: "Enter your Phone Number",
                obscure: false,
                textInputType: TextInputType.phone),
            verticalSpace(20),
            const TextContainer(
              text: "Password",
              marginRight: 200,
            ),
            verticalSpace(5), //PASSWORD INPUT
            TextForm(
              controller: passwordController,
              text: "Enter your Password",
              textInputType: TextInputType.text,
              obscure: obscure,
              icon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: setpasswordIcon(),
              ),
            ),
          ]),
      verticalSpace(80),
      ButtonLogin(
        emailController: phoneController,
        passwordController: passwordController,
      ),
      verticalSpace(5),
      SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyles.darkheadings,
              ),
              horizontalSpace(5),
              TextButton(
                onPressed: () {},
                child: Text("Sign Up",
                    style: TextStyles.darkheadings
                        .copyWith(color: ColorManager.primary)),
              ),
            ],
          ))
    ]);
  }

  Icon setpasswordIcon() {
    if (obscure) {
      return Icon(
        Icons.visibility,
        size: 10.sp,
      );
    } else {
      return Icon(
        Icons.visibility_off,
        size: 10.sp,
      );
    }
  }
}
