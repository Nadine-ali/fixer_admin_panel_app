// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/models/craftsman_model.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/repos/craftsman_repo.dart';

class CraftsmenRepoImpl implements CraftsmanRepository {
  final ApiServices apiServices;
  CraftsmenRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<CraftsmanModel>>> getCraftsmen() async {
    try {
      final response =
          await apiServices.getList(endPoint: ApiConstants.getCraftsmen);
      final List<CraftsmanModel> craftsmanList = [];
      for (var item in response) {
        craftsmanList.add(CraftsmanModel.fromJson(item));
      }
      return Right(craftsmanList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
