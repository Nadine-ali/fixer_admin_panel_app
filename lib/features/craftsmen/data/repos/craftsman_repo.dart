import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/models/craftsman_model.dart';

abstract class CraftsmanRepository {
  Future<Either<Failure, List<CraftsmanModel>>> getCraftsmen();
}
