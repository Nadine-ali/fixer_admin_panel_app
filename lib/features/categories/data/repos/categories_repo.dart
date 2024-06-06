import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/categories/data/models/service_model/service_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, ServiceModel>> addService(String name, int price,String category);
  Future<Either<Failure, List<ServiceModel>>> viewCategoryServices(int category);
}
