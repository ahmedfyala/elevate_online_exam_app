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

import '../../features/auth/data/api/retrofit_client.dart' as _i198;
import '../../features/auth/data/datasource/contracts/auth_datasource.dart'
    as _i119;
import '../../features/auth/data/datasource/impl/auth_offline_dataSource_impl.dart'
    as _i97;
import '../../features/auth/data/datasource/impl/auth_online_datasource_impl.dart'
    as _i787;
import '../../features/auth/data/repository/auth_repository.dart' as _i104;
import '../../features/auth/domain/contract/repository/auth_repo.dart' as _i331;
import '../../features/auth/presentation/view_models/forget_password/forget_password_view_model.dart'
    as _i771;
import '../../features/auth/presentation/view_models/login/login_viewmodel.dart'
    as _i710;
import '../../features/auth/presentation/view_models/register/register_viewmodel.dart'
    as _i630;
import '../../features/auth/usecases/forget_password_usecase.dart' as _i826;
import '../../features/auth/usecases/login_usecase.dart' as _i387;
import '../../features/auth/usecases/register_usecase.dart' as _i737;
import '../../features/auth/usecases/resetPassword.dart' as _i745;
import '../../features/auth/usecases/verify_reset_code.dart' as _i693;
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
    gh.lazySingleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i119.AuthOfflineDataSource>(
        () => _i97.AuthOfflineDataSourceImpl());
    gh.factory<String>(
      () => apiModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<_i198.RetrofitClient>(() => _i198.RetrofitClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i119.AuthOnlineDataSource>(
        () => _i787.AuthOnlineDatasourceImpl(gh<_i198.RetrofitClient>()));
    gh.factory<_i331.AuthRepo>(() => _i104.AuthRepositoryImpl(
          gh<_i119.AuthOfflineDataSource>(),
          gh<_i119.AuthOnlineDataSource>(),
        ));
    gh.factory<_i826.ForgetPasswordUseCase>(
        () => _i826.ForgetPasswordUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i387.LoginUseCase>(
        () => _i387.LoginUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i737.RegisterUseCase>(
        () => _i737.RegisterUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i693.VerifyResetCodeUseCase>(
        () => _i693.VerifyResetCodeUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i745.ResetPasswordUseCase>(
        () => _i745.ResetPasswordUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i710.LoginViewModel>(
        () => _i710.LoginViewModel(gh<_i387.LoginUseCase>()));
    gh.factory<_i771.ForgetPasswordViewModel>(
        () => _i771.ForgetPasswordViewModel(
              gh<_i826.ForgetPasswordUseCase>(),
              gh<_i693.VerifyResetCodeUseCase>(),
              gh<_i745.ResetPasswordUseCase>(),
            ));
    gh.factory<_i630.RegisterViewModel>(
        () => _i630.RegisterViewModel(gh<_i737.RegisterUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i211.ApiModule {}
