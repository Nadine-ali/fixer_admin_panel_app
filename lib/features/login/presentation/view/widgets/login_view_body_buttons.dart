import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/homepage/presentation/view/homepage_view.dart';
import 'package:fixer_admin_panel_app/features/login/cubit/login_cubit.dart';
import 'package:fixer_admin_panel_app/features/login/data/repos/login_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLogin extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const ButtonLogin(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepositoryImplementation>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed(HomePageView.routeName);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (state is LoginLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state is! LoginLoading)
                ElevatedButton(
                  onPressed: () {
                    cubit.login(
                        emailController.text, passwordController.text, context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp)),
                    // shape: const StadiumBorder(),
                    backgroundColor: ColorManager.primary,
                    fixedSize: Size(200.w, 100.h),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              verticalSpace(10),
              Text("or", style: TextStyles.darkheadings),
              verticalSpace(10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: ColorManager.primary,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp)),
                  // shape: const StadiumBorder(),
                  fixedSize: Size(200.w, 100.h),
                  backgroundColor: ColorManager.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.w,
                      height: 10.w,
                      child: Image.asset(
                        "assets/images/google_icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    horizontalSpace(10),
                    Text("Sign in with Google",
                        style: TextStyle(
                          fontSize: 8.sp,
                        )),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
