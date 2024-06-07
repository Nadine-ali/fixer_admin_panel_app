import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/coupon_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponsScreen extends StatelessWidget {
  final StoreModel store;
  const CouponsScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          StoresCubit(getIt<StoresRepoImpl>())..getStoreCoupons(store.name!),
      child: BlocBuilder<StoresCubit, StoresState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              "${store.name} Copouns",
              style: TextStyles.headings,
            ),
            centerTitle: true,
          ),
          body: state is GetStoreCouponsLoading
              ? const Center(child: TableShimmer(count: 20))
              : SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          defaultButton(
                              onPressed: () {
                                StoresCubit.get(context).addCoupon(store.name!);
                              },
                              text: "Add Copoun",
                              size: size),
                          defaultButton(
                              onPressed: () {
                                StoresCubit.get(context)
                                    .getStoreCoupons(store.name!);
                              },
                              text: "Refresh",
                              hasEdges: true,
                              size: size),
                        ],
                      ),
                      verticalSpace(50),
                      CouponTable(
                          coupons: StoresCubit.get(context).storeCoupons)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
