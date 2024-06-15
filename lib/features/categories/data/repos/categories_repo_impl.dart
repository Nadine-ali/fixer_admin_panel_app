import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/categories/data/models/service_model/service_model.dart';
import 'package:fixer_admin_panel_app/features/categories/data/repos/categories_repo.dart';
import 'package:fixer_admin_panel_app/main.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiServices apiServices;
  CategoriesRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, ServiceModel>> addService(
      String name, int price, String category) async {
    try {
      final response = await apiServices.post(
        endPoint: ApiConstants.addService,
        data: {
          "name": name,
          "price": price,
          "category": category,
        },
        jwt: token!,
      );
      return Right(ServiceModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ServiceModel>>> viewCategoryServices(
      int category) async {
    try {
      final response = await apiServices.getList(
        endPoint: "Admin/$category",
      );
      final services =
          response.map((item) => ServiceModel.fromJson(item)).toList();
      return Right(services);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteService(int id) async {
    try {
      final response = await apiServices.delete(
        endPoint: "Admin/Service/$id",
        jwt: token!,
      );
      return Right(response["Message"]);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
