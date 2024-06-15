import 'package:dio/dio.dart';
import 'package:fixer_admin_panel_app/core/networks/api_constants.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.get("${ApiConstants.baseUrl}$endPoint");
    return response.data;
  }

  Future<List<dynamic>> getList({
    required String endPoint,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.get("${ApiConstants.baseUrl}$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response =
        await _dio.post("${ApiConstants.baseUrl}$endPoint", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required dynamic data,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response =
        await _dio.put("${ApiConstants.baseUrl}$endPoint", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    String? jwt,
  }) async {
    _dio.options.headers = {
      "Authorization": "Bearer $jwt",
      "Content-Type": "application/json",
    };
    var response = await _dio.delete("${ApiConstants.baseUrl}$endPoint");
    return response.data;
  }
}
