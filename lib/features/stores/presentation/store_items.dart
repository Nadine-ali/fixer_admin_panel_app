import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/routing/app_router.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/presentation/view/widget/table_shimmer.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/add_item_screen.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/coupons_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreItems extends StatelessWidget {
  final StoreModel store;
  const StoreItems({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          StoresCubit(getIt<StoresRepoImpl>())..getStoreItems(store.id!),
      child: BlocBuilder<StoresCubit, StoresState>(
        builder: (context, state) {
          StoresCubit cubit = StoresCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                store.name!,
                style: TextStyles.headings,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              "Are you sure you want to delete ${store.name}?"),
                          actions: [
                            defaultButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: "Cancel",
                                size: size,
                                width: 85,
                                hasEdges: true),
                            BlocProvider(
                              create: (context) =>
                                  StoresCubit(getIt<StoresRepoImpl>()),
                              child: BlocBuilder<StoresCubit, StoresState>(
                                builder: (context, state) {
                                  if (state is DeleteStoreLoading) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return defaultButton(
                                      width: 85,
                                      onPressed: () {
                                        StoresCubit.get(context)
                                            .deleteStore(store.id!, context);
                                      },
                                      text: "Delete",
                                      size: size,
                                    );
                                  }
                                },
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                horizontalSpace(10),
              ],
              centerTitle: true,
            ),
            body: state is GetStoreItemsLoading
                ? const TableShimmer(count: 20)
                : state is GetStoreItemsSuccess
                    ? cubit.storeItems.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Text(
                                  "No items found !",
                                  style: TextStyles.headings,
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      defaultButton(
                                          onPressed: () {
                                            navigateTo(
                                                context,
                                                AddItem(
                                                    storeName: store.name!));
                                          },
                                          text: "Add Item",
                                          size: size,
                                          hasEdges: false,
                                          width: 100,
                                          height: 40),
                                      defaultButton(
                                          onPressed: () {
                                            cubit.getStoreItems(store.id!);
                                          },
                                          text: "Refresh",
                                          size: size,
                                          hasEdges: true,
                                          width: 100,
                                          height: 40),
                                      defaultButton(
                                          onPressed: () {
                                            navigateTo(context,
                                                CouponsScreen(store: store));
                                          },
                                          text: "Coupons",
                                          size: size,
                                          hasEdges: false,
                                          width: 100,
                                          height: 40),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      defaultButton(
                                          onPressed: () {
                                            navigateTo(
                                                context,
                                                AddItem(
                                                    storeName: store.name!));
                                          },
                                          text: "Add Item",
                                          size: size,
                                          hasEdges: false,
                                          width: 100,
                                          height: 40),
                                      defaultButton(
                                          onPressed: () {
                                            cubit.getStoreItems(store.id!);
                                          },
                                          text: "Refresh",
                                          size: size,
                                          hasEdges: true,
                                          width: 100,
                                          height: 40),
                                      defaultButton(
                                          onPressed: () {
                                            navigateTo(context,
                                                CouponsScreen(store: store));
                                          },
                                          text: "Coupons",
                                          size: size,
                                          hasEdges: false,
                                          width: 100,
                                          height: 40),
                                    ],
                                  ),
                                  verticalSpace(70),
                                  Center(
                                    child: DataTable(
                                      columnSpacing: size.width * 0.3,
                                      dataRowMinHeight: size.height * 0.05,
                                      headingRowColor:
                                          WidgetStateProperty.resolveWith<
                                              Color>((Set<WidgetState> states) {
                                        return ColorManager.primary;
                                      }),
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Text('Item Name',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorManager.white)),
                                        ),
                                        DataColumn(
                                          label: Text('Item Price',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorManager.white)),
                                        ),
                                        DataColumn(
                                          label: Text('Item Quantity',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorManager.white)),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                        cubit.storeItems.length,
                                        (int index) => DataRow(
                                          onLongPress: () {
                                            StoresCubit.get(context).deleteItem(
                                                cubit.storeItems[index].id!,
                                                context);
                                          },
                                          color: WidgetStateProperty
                                              .resolveWith<Color?>(
                                                  (Set<WidgetState> states) {
                                            if (index.isEven) {
                                              return ColorManager.darkwhite;
                                            } else {
                                              return ColorManager.white;
                                            }
                                          }),
                                          cells: <DataCell>[
                                            DataCell(Text(
                                              cubit.storeItems[index].name!,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                            DataCell(Text(
                                              cubit.storeItems[index].price
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                            DataCell(Text(
                                              cubit.storeItems[index].quantity
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  defaultButton(
                                      onPressed: () {
                                        navigateTo(context,
                                            AddItem(storeName: store.name!));
                                      },
                                      text: "Add Item",
                                      size: size,
                                      hasEdges: false,
                                      width: 100,
                                      height: 40),
                                  defaultButton(
                                      onPressed: () {
                                        cubit.getStoreItems(store.id!);
                                      },
                                      text: "Refresh",
                                      size: size,
                                      hasEdges: true,
                                      width: 100,
                                      height: 40),
                                  defaultButton(
                                      onPressed: () {
                                        navigateTo(context,
                                            CouponsScreen(store: store));
                                      },
                                      text: "Coupons",
                                      size: size,
                                      hasEdges: false,
                                      width: 100,
                                      height: 40),
                                ],
                              ),
                              verticalSpace(70),
                              Center(
                                child: DataTable(
                                  columnSpacing: size.width * 0.3,
                                  dataRowMinHeight: size.height * 0.05,
                                  headingRowColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                          (Set<WidgetState> states) {
                                    return ColorManager.primary;
                                  }),
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('Item Name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorManager.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Item Price',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorManager.white)),
                                    ),
                                    DataColumn(
                                      label: Text('Item Quantity',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorManager.white)),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    cubit.storeItems.length,
                                    (int index) => DataRow(
                                      onLongPress: () {
                                        StoresCubit.get(context).deleteItem(
                                            cubit.storeItems[index].id!,
                                            context);
                                      },
                                      color: WidgetStateProperty.resolveWith<
                                          Color?>((Set<WidgetState> states) {
                                        if (index.isEven) {
                                          return ColorManager.darkwhite;
                                        } else {
                                          return ColorManager.white;
                                        }
                                      }),
                                      cells: <DataCell>[
                                        DataCell(Text(
                                          cubit.storeItems[index].name!,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          cubit.storeItems[index].price
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          cubit.storeItems[index].quantity
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
