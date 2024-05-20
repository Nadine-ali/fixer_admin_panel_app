// ignore_for_file: deprecated_member_use
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/models/messege_model.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/repos/dashboard_repo.dart';
import 'package:fixer_admin_panel_app/main.dart';

class DashBoardRepoImpl implements DashboardRepository {
  final ApiServices apiServices;
  DashBoardRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<MessageModel>>> getDashboardData() async {
    try {
      final response = await apiServices.getList(
          endPoint: ApiConstants.viewMessages, jwt: token);
      final List<MessageModel> messageList = [];
      for (var item in response) {
        messageList.add(MessageModel.fromJson(item));
      }
      return Right(messageList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
