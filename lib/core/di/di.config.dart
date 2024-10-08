// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/api_manger.dart' as _i758;
import '../../features/auth/data/api/retrofit_client.dart' as _i198;
import '../../features/auth/data/datasource/contracts/auth_datasource.dart'
    as _i119;
import '../../features/auth/data/datasource/impl/auth_offline_dataSource_impl.dart'
    as _i97;
import '../../features/auth/data/datasource/impl/auth_online_datasource_impl.dart'
    as _i787;
import '../../features/auth/data/repository/auth_repository.dart' as _i104;
import '../../features/auth/domain/contract/repository/auth_repo.dart' as _i331;
import '../../features/auth/presentation/view_models/login_viewmodel.dart'
    as _i138;
import '../../features/auth/usecases/login_usecase.dart' as _i387;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.lazySingleton<_i361.Dio>(() => apiModule.dio());
    gh.factory<_i119.AuthOfflineDataSource>(
        () => _i97.AuthOfflineDataSourceImpl());
    gh.lazySingleton<_i198.RetrofitClient>(
        () => apiModule.retrofitClient(gh<_i361.Dio>()));
    gh.factory<_i758.ApiManger>(
        () => _i758.ApiManger(gh<_i198.RetrofitClient>()));
    gh.factory<_i119.AuthOnlineDataSource>(
        () => _i787.AuthOnlineDatasourceImpl(gh<_i758.ApiManger>()));
    gh.factory<_i331.AuthRepo>(() => _i104.AuthRepositoryImpl(
          gh<_i119.AuthOfflineDataSource>(),
          gh<_i119.AuthOnlineDataSource>(),
        ));
    gh.factory<_i387.LoginUseCase>(
        () => _i387.LoginUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i138.LoginViewModel>(
        () => _i138.LoginViewModel(gh<_i387.LoginUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i211.ApiModule {}
