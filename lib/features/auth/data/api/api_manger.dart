// import 'dart:async';
//
// import 'package:elevate_online_exam_app/features/auth/data/api/model/request/register_request.dart';
// import 'package:injectable/injectable.dart';
//
// import 'model/response/auth_response.dart';
// import 'retrofit_client.dart';
//
// @injectable
// @singleton
// class ApiManger {
//   final RetrofitClient _retrofitClient;
//   @factoryMethod
//   ApiManger(this._retrofitClient);
//
//   Future<AuthResponse> login(String email, String password) async {
//     var apiCall = await _retrofitClient.login({
//       "email": email,
//       "password": password,
//     });
//     return apiCall;
//   }
//
//   Future<AuthResponse> register(RegisterRequest requestBody) async {
//     var apiCall = await _retrofitClient.register(requestBody.toJson());
//     return apiCall;
//   }
// }
