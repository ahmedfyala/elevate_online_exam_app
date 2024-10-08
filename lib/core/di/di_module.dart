import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/api/retrofit_client.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  RetrofitClient retrofitClient(Dio dio) {
    return RetrofitClient(dio);
  }
}
