import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/text_form_field_model.dart';
import 'package:fixer_admin_panel_app/features/locations/data/repos/location_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/locations/manager/cubit/location_cubit.dart';
import 'package:fixer_admin_panel_app/features/locations/presentation/locations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    return BlocProvider(
      create: (context) => LocationCubit(getIt<LocationRepoImpl>()),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Add Location',
                style: TextStyles.headings,
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.3,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorManager.white,
                          border: Border.all(color: ColorManager.grey)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: locationController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          hintText: "Location",
                          hintStyle: TextStyles.lightheadings
                              .copyWith(fontWeight: FontWeight.w400),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      )),
                ),
                verticalSpace(120),
                if (state is! LocationSetLoading)
                  defaultButton(
                    onPressed: () {
                      LocationCubit cubit = LocationCubit.get(context);
                      cubit.setLocations(locationController.text, context);
                    },
                    text: 'Add Location',
                    size: size,
                  ),
                if (state is LocationSetLoading)
                  const CircularProgressIndicator()
              ],
            ),
          );
        },
      ),
    );
  }
}
