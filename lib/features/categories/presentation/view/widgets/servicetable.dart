import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer.dart';
import 'package:fixer_admin_panel_app/features/categories/data/repos/categories_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/categories/manager/cubit/categories_cubit.dart';
import 'package:fixer_admin_panel_app/features/categories/presentation/view/widgets/categorytable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesScreen extends StatelessWidget {
  final Size size;
  final int id;
  final String category;
  const ServicesScreen(
      {super.key,
      required this.size,
      required this.category,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(getIt<CategoriesRepoImpl>())
        ..viewCategoryServices(id),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("$category Services", style: TextStyles.headings),
            centerTitle: true,
          ),
          body: state is GetCategoryServicesLoading
              ? const Center(child: TableShimmer(count: 20))
              : SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: 600.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          verticalSpace(100),
                          CategoryTable(
                            services: CategoriesCubit.get(context).services,
                          ),
                          verticalSpace(100),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
