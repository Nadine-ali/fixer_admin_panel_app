// ignore_for_file: deprecated_member_use, void_checks
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/login/data/repos/login_repo.dart';
import 'package:fixer_admin_panel_app/main.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final ApiServices apiServices;
  LoginRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final response = await apiServices.post(
        endPoint: ApiConstants.login,
        data: {
          "handler": email,
          "password": password,
        },
      );
      token = response["jwt"];
      kTokenBox.put(kTokenBoxString, token);
      return Right(response["message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
