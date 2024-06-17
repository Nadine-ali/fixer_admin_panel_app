import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/copoun_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/item_model/item_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';

abstract class StoresRepo {
  Future<Either<Failure, List<StoreModel>>> getStores();
  Future<Either<Failure, List<ItemModel>>> getStoreItems(int id);
  Future<Either<Failure, String>> addStore(
      String name, String location, String description,String number);
  Future<Either<Failure, String>> deleteStore(int id);
  Future<Either<Failure, String>> addItem(
      String name, String price, int quantity, String store);
  Future<Either<Failure, String>> deleteItem(int id);
  Future<Either<Failure, List<CopounModel>>> getStoreCoupons(String store);
  Future<Either<Failure, CopounModel>> addCoupon(String store);
  Future<Either<Failure, String>> uploadImage(File image, int id);
}
