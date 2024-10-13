import 'package:dio/dio.dart';

class ParsingError implements Exception {
  final String parsingErrorMessage;
  final String parsingErrorClass;

  ParsingError({
    required this.parsingErrorMessage,
    required this.parsingErrorClass,
  });
}

class NoInternetException implements Exception {}

class HandleDioException implements Exception {}

class ServerError implements Exception {
  String? message;
  int? statusCode;
  ServerError({this.message, this.statusCode});

  factory ServerError.handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      // TODO: Handle this case.
      case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
      case DioExceptionType.receiveTimeout:
      // TODO: Handle this case.
      case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 401 ||
            error.response?.statusCode == 403 ||
            error.response?.statusCode == 409) {
          return ServerError(message: error.response?.data["message"]);
        } else {
          return ServerError(message: "response");
        }
      // TODO: Handle this case.
      case DioExceptionType.cancel:
      // TODO: Handle this case.
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
      case DioExceptionType.unknown:
      // TODO: Handle this case.
    }
    return ServerError();
  }
}
