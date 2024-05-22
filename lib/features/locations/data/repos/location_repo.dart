import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';
import 'package:fixer_admin_panel_app/features/locations/data/models/location_model.dart';

abstract class LocationRepo {
  Future<Either<Failure, List<LocationModel>>> getLocations();
  Future<Either<Failure, String>> setLocations(String location);
}
