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

  @override
  Future<Either<Failure, String>> acceptCraftsman(int id) async {
    try {
      final response = await apiServices.put(
        endPoint: "Admin/$id/Verification",
        data: {},
      );
      return Right(response['Message']);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> rejectCraftsman(
      int id, String subject, String body) async {
    try {
      final response = await apiServices.post(
        endPoint: ApiConstants.rejectCraftsman,
        data: {
          "cratftsman_id": id,
          "subject": subject,
          "body": body,
        },
      );
      return Right(response['status']);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
