import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../error_handeling/AppExceptions.dart';
import '../error_handeling/Result.dart';

Future<Result<T>> executeApi<T>(Future<Result<T>> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return result;
  } on DioException catch (ex) {
    return Fail(ex);
  } on TimeoutException catch (ex) {
    return Fail(NoInternetException());
  } on IOException catch (ex) {
    return Fail(NoInternetException());
  }
}
