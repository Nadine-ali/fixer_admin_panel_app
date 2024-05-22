// ignore_for_file: library_private_types_in_public_api
import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/routing/app_router.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/charts_shimmer.dart';
import 'package:fixer_admin_panel_app/features/locations/presentation/add_location.dart';
import 'package:fixer_admin_panel_app/features/locations/presentation/location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixer_admin_panel_app/features/locations/data/repos/location_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/locations/manager/cubit/location_cubit.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';

class SelectLocations extends StatefulWidget {
  const SelectLocations({super.key});

  @override
  _SelectLocationsState createState() => _SelectLocationsState();
}

class _SelectLocationsState extends State<SelectLocations> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          LocationCubit(getIt<LocationRepoImpl>())..getLocations(),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          LocationCubit cubit = LocationCubit.get(context);
          if (state is LocationLoading) {
            return const ChartsShimmer();
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  defaultButton(
                      onPressed: () {
                        navigateTo(context, const AddLocation());
                      },
                      text: "Add location",
                      size: size),
                  verticalSpace(20),
                  SizedBox(
                      height: size.height * 0.7,
                      width: double.infinity,
                      child: GridView.count(
                        childAspectRatio: 7 / 4,
                        crossAxisCount: size.width > 1450
                            ? 4
                            : size.width > 1300
                                ? 3
                                : 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: cubit.locations.isNotEmpty
                            ? cubit.locations.map((location) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: LocationCardModel(
                                    location: location,
                                  ),
                                );
                              }).toList()
                            : <Widget>[
                                Center(
                                  child: Text(
                                    "No Locations",
                                    style: TextStyles.normal,
                                  ),
                                )
                              ],
                      )),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
