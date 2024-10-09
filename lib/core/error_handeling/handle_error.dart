import 'package:elevate_online_exam_app/core/error_handeling/AppExceptions.dart';

String? errorStateHandler(Exception exception) {
  if (exception is NoInternetException) {
    return 'No internet connection';
  } else if (exception is ServerError) {
    return exception.message;
  }
  return 'something went wrong';
}
