import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/store_items.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllStores extends StatefulWidget {
  final VoidCallback onChanged;
  const AllStores({super.key, required this.onChanged});

  @override
  State<AllStores> createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => StoresCubit(getIt<StoresRepoImpl>())..getStores(),
      child: BlocBuilder<StoresCubit, StoresState>(
        builder: (context, state) {
          StoresCubit cubit = StoresCubit.get(context);
          if (cubit.stores.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          widget.onChanged();
                        },
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorManager.primary,
                          ),
                          child: Center(
                            child: Text(
                              "Add Store",
                              style: TextStyles.normal
                                  .copyWith(color: ColorManager.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(50),
                    DataTable(
                      columnSpacing: size.width * 0.2,
                      dataRowMinHeight: size.height * 0.05,
                      headingRowColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return ColorManager.primary;
                      }),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text('Store Name',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: ColorManager.white)),
                        ),
                        DataColumn(
                          label: Text('Location',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: ColorManager.white)),
                        ),
                        DataColumn(
                          label: Text('Item Count',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: ColorManager.white)),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        cubit.stores.length,
                        (int index) => DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (index.isEven) {
                              return ColorManager.darkwhite;
                            } else {
                              return ColorManager.white;
                            }
                          }),
                          onLongPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoreItems(
                                store: cubit.stores[index],
                              ),
                            ),
                          ),
                          cells: <DataCell>[
                            DataCell(Text(
                              cubit.stores[index].name!,
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              cubit.stores[index].location!,
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              cubit.stores[index].itemsCount.toString(),
                              overflow: TextOverflow.ellipsis,
                            )),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(50),
                    Text(
                      "Long Press to see store details !",
                      style: TextStyles.headings,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SingleChildScrollView(child: TableShimmer(count: 20));
          }
        },
      ),
    );
  }
}
