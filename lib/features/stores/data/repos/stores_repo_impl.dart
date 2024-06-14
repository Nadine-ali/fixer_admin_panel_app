// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/copoun_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/item_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo.dart';
import 'package:fixer_admin_panel_app/main.dart';

class StoresRepoImpl implements StoresRepo {
  final ApiServices apiservices;

  StoresRepoImpl({required this.apiservices});

  @override
  Future<Either<Failure, List<ItemModel>>> getStoreItems(int id) async {
    try {
      final response = await apiservices.getList(endPoint: "Store/$id/items");
      final List<ItemModel> itemList = [];
      for (var item in response) {
        itemList.add(ItemModel.fromJson(item));
      }
      return Right(itemList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<StoreModel>>> getStores() async {
    try {
      final response = await apiservices.get(endPoint: ApiConstants.getStores);
      final List<StoreModel> storeList = [];
      for (var item in response["stores"]) {
        storeList.add(StoreModel.fromJson(item));
      }
      return Right(storeList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addItem(
      String name, String price, int quantity, String store) async {
    try {
      final response = await apiservices.post(
        endPoint: ApiConstants.addItem,
        jwt: token!,
        data: {
          "name": name,
          "price": price,
          "quantity": quantity,
          "store_name": store,
        },
      );
      return Right(response["message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addStore(
      String name, String location, String description) async {
    try {
      final response = await apiservices.post(
        endPoint: ApiConstants.addStore,
        jwt: token!,
        data: {
          "name": name,
          "location": location,
          "description": description,
        },
      );
      return Right(response["message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CopounModel>> addCoupon(String store) async{
    try{
      final response = await apiservices.get(
        endPoint: "Admin/Coupon/$store",
      );
      return Right(CopounModel.fromJson(response));
    }catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CopounModel>>> getStoreCoupons(String store)async {
   try{
      final response = await apiservices.getList(
        endPoint: "Admin/AllCoupons/$store",
      );
      return Right(response.map((item) => CopounModel.fromJson(item)).toList());
    }catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, String>> deleteItem(int id) async{
    try{
      final response = await apiservices.delete(
        endPoint: "Admin/Item/$id",
        jwt: token!,
      );
      return Right(response["Message"]);
    }catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, String>> deleteStore(int id) async{
   try{
      final response = await apiservices.delete(
        endPoint: "Admin/Store/$id",
        jwt: token!,
      );
      return Right(response["message"]);
    }catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
   }
  }
}
