import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/api_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(
      Dio(),
    ),
  );
}
