import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/login/data/repos/login_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(
      Dio(),
    ),
  );
  getIt.registerLazySingleton<LoginRepositoryImplementation>(
    () => LoginRepositoryImplementation(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<DashBoardRepoImpl>(
    () => DashBoardRepoImpl(
      apiServices: getIt<ApiServices>(),
    ),
  );
}
