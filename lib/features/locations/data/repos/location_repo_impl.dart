// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/locations/data/models/location_model.dart';
import 'package:fixer_admin_panel_app/features/locations/data/repos/location_repo.dart';
import 'package:fixer_admin_panel_app/main.dart';

class LocationRepoImpl extends LocationRepo {
  final ApiServices services;
  LocationRepoImpl({
    required this.services,
  });

  @override
  Future<Either<Failure, List<LocationModel>>> getLocations() async {
    try {
      final response =
          await services.getList(endPoint: ApiConstants.operatingLocations);
      final operatingAreas =
          response.map((item) => LocationModel.fromJson(item)).toList();
      return Right(operatingAreas);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> setLocations(String location) async {
    try {
      final response = await services.post(
        endPoint: ApiConstants.setNewLocation,
        jwt: token!,
        data: {
          "locations": [location],
        },
      );
      
      return Right("");
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
