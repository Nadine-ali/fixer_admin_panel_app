import 'package:dartz/dartz.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login(String email, String password);
}
