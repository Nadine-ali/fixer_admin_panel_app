import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/models/messege_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<MessageModel>>> getDashboardData();
}
