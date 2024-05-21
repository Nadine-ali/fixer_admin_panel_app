import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/item_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';

abstract class StoresRepo {
  Future<Either<Failure, List<StoreModel>>> getStores();
  Future<Either<Failure, List<ItemModel>>> getStoreItems(int id);
  Future<Either<Failure, String>> addStore(String name ,String location ,String description);
  Future<Either<Failure, String>> addItem(String name ,String price ,int quantity,String store);
}
