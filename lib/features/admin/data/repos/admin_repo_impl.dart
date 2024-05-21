// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';
import 'package:fixer_admin_panel_app/features/admin/data/repos/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final ApiServices apiServices;
  AdminRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<AdminModel>>> getAdmins() async {
    try {
      final resonse =
          await apiServices.getList(endPoint: ApiConstants.getAdmins);
      final List<AdminModel> adminList = [];
      for (var item in resonse) {
        adminList.add(AdminModel.fromJson(item));
      }

      return Right(adminList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
