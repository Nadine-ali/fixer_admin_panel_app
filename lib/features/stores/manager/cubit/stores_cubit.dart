// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/error_snackbar.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/copoun_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  final StoresRepoImpl repo;
  StoresCubit(this.repo) : super(StoresInitial());
  static StoresCubit get(context) => BlocProvider.of(context);

  List<StoreModel> stores = [];

  void getStores() async {
    emit(StoresLoading());
    final response = await repo.getStores();
    response.fold(
      (l) {
        emit(StoresFailed(l.message));
      },
      (r) {
        stores = r;
        emit(StoresSuccess(r));
      },
    );
  }

  List<ItemModel> storeItems = [];

  void getStoreItems(int id) async {
    emit(GetStoreItemsLoading());
    final response = await repo.getStoreItems(id);
    response.fold(
      (l) {
        emit(GetStoreItemsFailed(l.message));
      },
      (r) {
        storeItems = r;
        emit(GetStoreItemsSuccess(r));
      },
    );
  }

  Future<void> addStore(
      String name, String location, String description,String number) async {
    emit(AddStoreLoading());
    final response = await repo.addStore(name, location, description,number);
    response.fold(
      (l) {
        emit(AddStoreFailed(l.message));
      },
      (r) {
        emit(AddStoreSuccess(r));
      },
    );
  }

  Future<void> addItem(
      String name, String price, int quantity, String store) async {
    emit(AddItemLoading());
    final response = await repo.addItem(name, price, quantity, store);
    response.fold(
      (l) {
        emit(AddItemFailed(l.message));
      },
      (r) {
        emit(AddItemSuccess(r));
      },
    );
  }

  List<CopounModel> storeCoupons = [];

  void getStoreCoupons(String store) async {
    emit(GetStoreCouponsLoading());
    final response = await repo.getStoreCoupons(store);
    response.fold(
      (l) {
        emit(GetStoreCouponsFailed(l.message));
      },
      (r) {
        storeCoupons = r;
        emit(GetStoreCouponsSuccess(r));
      },
    );
  }

  Future<void> addCoupon(String store) async {
    final response = await repo.addCoupon(store);
    response.fold(
      (l) {
        emit(AddCouponFailed(l.message));
      },
      (r) {
        emit(AddCouponSuccess(r));
      },
    );
  }

  Future<void> deleteItem(int id, context) async {
    emit(DeleteItemLoading());
    final response = await repo.deleteItem(id);
    response.fold(
      (l) {
        emit(DeleteItemFailed(l.message));
      },
      (r) {
        showErrorSnackbar(context, r);
        emit(DeleteItemSuccess(r));
      },
    );
  }

  Future<void> deleteStore(int id, context) async {
    emit(DeleteStoreLoading());
    final response = await repo.deleteStore(id);
    response.fold(
      (l) {
        emit(DeleteStoreFailed(l.message));
      },
      (r) {
        showErrorSnackbar(context, r);
        Navigator.pop(context);
        Navigator.pop(context);
        emit(DeleteStoreSuccess(r));
      },
    );
  }

  File? itemImage;
  var itemFile;
  var itemPicker = ImagePicker();

  Future<void> getitemImagefromGallery(context) async {
    itemFile = await itemPicker.pickImage(source: ImageSource.gallery);
    if (itemFile != null) {
      itemImage = File(itemFile.path);

      emit(ImagePickedFromGallerySuccessState());
    } else {
      showErrorSnackbar(
        context,
        "no image selected",
      );
      emit(ImagePickedFromGalleryErrorState());
    }
  }

  Future<void> uploadItemImage(int id, context) async {
    emit(UploadImageLoadingState());
    final response = await repo.uploadImage(itemImage!, id);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message.toString());
        emit(UploadImageErrorState(l.message));
      },
      (r) {
        emit(UploadImageSuccessState(r));
        Navigator.pop(context);
        print(r);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Image Uploaded !'),
          ),
        );
      },
    );
  }
}
