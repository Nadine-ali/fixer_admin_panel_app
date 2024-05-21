import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';

abstract class AdminRepo {
  Future<Either<Failure, List<AdminModel>>> getAdmins();
}
