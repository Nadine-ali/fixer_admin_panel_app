// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connection Timeout with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send Timeout with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive Timeout with api server");
      case DioExceptionType.badCertificate:
        return ServerFailure("bad Certificate with api server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request cancelled with api server");
      case DioExceptionType.connectionError:
        return ServerFailure("No Connection with api server");
      case DioExceptionType.unknown:
        return ServerFailure("Unknown Error with api server");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("request not found, Please try again later !");
    } else if (statusCode == 500) {
      return ServerFailure(
          "A problem occured within remote server, Please try again later !");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["message"]);
    } else if (statusCode == 422) {
      print(response);
      return ServerFailure(response["msg"] ?? response["message"]);
    } else {
      return ServerFailure(response["message"]);
    }
  }
}
