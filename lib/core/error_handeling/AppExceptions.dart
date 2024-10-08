class ParsingError implements Exception {
  final String parsingErrorMessage;
  final String parsingErrorClass;

  ParsingError({
    required this.parsingErrorMessage,
    required this.parsingErrorClass,
  });
}

class NoInternetException implements Exception {}

class ServerError implements Exception {
  String? message;
  int? statusCode;
  ServerError({this.message, this.statusCode});
}
