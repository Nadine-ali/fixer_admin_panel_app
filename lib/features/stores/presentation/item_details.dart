import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/colors.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/admin/presentation/view/widget/image_upload_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetails extends StatelessWidget {
  final ItemModel item;
  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name!),
        actions: [
          horizontalSpace(100),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title:
                        Text("Are you sure you want to delete ${item.name}?"),
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
                            if (state is DeleteItemLoading) {
                              return const CircularProgressIndicator();
                            } else {
                              return defaultButton(
                                width: 85,
                                onPressed: () {
                                  StoresCubit.get(context)
                                      .deleteItem(item.id!, context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
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
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
          child: Center(
            child: Container(
              width: size.width * 0.45,
              height: size.height,
              color: ColorManager.darkwhite,
              child: Center(
                child: Container(
                  width: size.width * 0.55,
                  height: size.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // shadow color
                        spreadRadius: 3, // spread radius
                        blurRadius: 7, // blur radius
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: ColorManager.white,
                  ),
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.4,
                        height: size.height,
                        padding: const EdgeInsets.all(12),
                        color: ColorManager.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: size.height * 0.2,
                                width: size.width * 0.3,
                                child: item.image == null
                                    ? Column(
                                        children: [
                                          const Icon(
                                            Icons.error,
                                            size: 50,
                                          ),
                                          Text(
                                            "No Image Yet !",
                                            style: TextStyles.headings,
                                          ),
                                        ],
                                      )
                                    : Image.network(item.image!)),
                            verticalSpace(50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Item Name: ",
                                  style: TextStyles.headings,
                                ),
                                Text(
                                  item.name!,
                                  style: TextStyles.headings,
                                ),
                              ],
                            ),
                            verticalSpace(50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Item Price: ",
                                  style: TextStyles.headings,
                                ),
                                Text(
                                  item.price.toString(),
                                  style: TextStyles.headings,
                                ),
                              ],
                            ),
                            verticalSpace(50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Item Count: ",
                                  style: TextStyles.headings,
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: TextStyles.headings,
                                ),
                              ],
                            ),
                            verticalSpace(70),
                            BlocProvider(
                              create: (context) =>
                                  StoresCubit(getIt<StoresRepoImpl>()),
                              child: BlocBuilder<StoresCubit, StoresState>(
                                builder: (context, state) => Column(
                                  children: [
                                    ImageUploadModel(
                                        text: "Add Image",
                                        onPressed: () {
                                          StoresCubit.get(context)
                                              .getitemImagefromGallery(context);
                                        },
                                        width: size.width * 0.06),
                                    verticalSpace(50),
                                    if (StoresCubit.get(context).itemImage !=
                                        null)
                                      SizedBox(
                                        height: size.height * 0.15,
                                        width: size.width * 0.1,
                                        child: Image.file(
                                          StoresCubit.get(context).itemImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    verticalSpace(50),
                                    if (StoresCubit.get(context).itemImage !=
                                        null)
                                      defaultButton(
                                          onPressed: () {
                                            StoresCubit.get(context)
                                                .uploadItemImage(
                                                    item.id!, context);
                                          },
                                          text: "Upload",
                                          size: size)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
