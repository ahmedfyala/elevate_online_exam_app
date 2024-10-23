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
import '../../features/home/presentation/viewmodel/home_viewmodel.dart'
    as _i376;
import '../../features/questions/data/api/retrofit_client.dart' as _i415;
import '../../features/questions/data/datasource/contract/exam_datasource.dart'
    as _i914;
import '../../features/questions/data/datasource/impl/exam_offline_datasource.dart'
    as _i276;
import '../../features/questions/data/datasource/impl/exam_online_datasource.dart'
    as _i68;
import '../../features/questions/data/repository/exam_repository_impl.dart'
    as _i263;
import '../../features/questions/domain/contract/repository/exam_repository.dart'
    as _i754;
import '../../features/questions/presentation/viewmodels/check_answers/check_answer_viewmodel.dart'
    as _i65;
import '../../features/questions/presentation/viewmodels/exam_questions/exam_questions_viewmodel.dart'
    as _i490;
import '../../features/questions/usecases/check_questions_usecase.dart'
    as _i943;
import '../../features/questions/usecases/exam_questions_usecase.dart' as _i510;
import '../../features/results/data/datasource/contract/result_datasource.dart'
    as _i161;
import '../../features/results/data/datasource/implmentation/result_offline_datasource_impl.dart'
    as _i946;
import '../../features/results/data/repository/result_repository_impl.dart'
    as _i451;
import '../../features/results/domain/contract/result_repository.dart'
    as _i1008;
import '../../features/results/presentation/viewmodel/home_result/home_result_viewmodel.dart'
    as _i461;
import '../../features/results/usecase/result_usecase.dart' as _i30;
import '../routing/app_router.dart' as _i282;
import '../shared_prefrense/token_storage.dart' as _i1;
import 'di_module.dart' as _i211;
import 'hive_module.dart' as _i576;

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
    gh.factory<_i1.MyServices>(() => _i1.MyServices());
    gh.factory<_i376.HomeViewModel>(() => _i376.HomeViewModel());
    gh.factory<_i576.HiveModule>(() => _i576.HiveModule());
    gh.lazySingleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i914.ExamOfflineDatasource>(
        () => _i276.ExamOfflineDataSourceImpl(gh<_i576.HiveModule>()));
    gh.factory<String>(
      () => apiModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<_i161.ResultOfflineDataSource>(
        () => _i946.ResultOfflineDataSourceImpl(gh<_i576.HiveModule>()));
    gh.factory<_i119.AuthOfflineDataSource>(
        () => _i97.AuthOfflineDataSourceImpl(gh<_i1.MyServices>()));
    gh.factory<_i198.RetrofitClient>(() => _i198.RetrofitClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i415.RetrofitClient>(() => _i415.RetrofitClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i1008.ResultRepository>(
        () => _i451.ResultRepositoryImpl(gh<_i161.ResultOfflineDataSource>()));
    gh.factory<_i119.AuthOnlineDataSource>(
        () => _i787.AuthOnlineDatasourceImpl(gh<_i198.RetrofitClient>()));
    gh.factory<_i914.ExamOnlineDatasource>(
        () => _i68.ExamOnlineDataSourceImpl(gh<_i415.RetrofitClient>()));
    gh.factory<_i331.AuthRepo>(() => _i104.AuthRepositoryImpl(
          gh<_i119.AuthOfflineDataSource>(),
          gh<_i119.AuthOnlineDataSource>(),
        ));
    gh.factory<_i754.ExamRepository>(() => _i263.ExamRepositoryImpl(
          gh<_i914.ExamOnlineDatasource>(),
          gh<_i914.ExamOfflineDatasource>(),
          gh<_i119.AuthOfflineDataSource>(),
        ));
    gh.factory<_i30.ResultUseCase>(
        () => _i30.ResultUseCase(gh<_i1008.ResultRepository>()));
    gh.factory<_i282.AppRouter>(() => _i282.AppRouter(gh<_i331.AuthRepo>()));
    gh.factory<_i826.ForgetPasswordUseCase>(
        () => _i826.ForgetPasswordUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i387.LoginUseCase>(
        () => _i387.LoginUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i737.RegisterUseCase>(
        () => _i737.RegisterUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i745.ResetPasswordUseCase>(
        () => _i745.ResetPasswordUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i693.VerifyResetCodeUseCase>(
        () => _i693.VerifyResetCodeUseCase(gh<_i331.AuthRepo>()));
    gh.factory<_i710.LoginViewModel>(
        () => _i710.LoginViewModel(gh<_i387.LoginUseCase>()));
    gh.factory<_i510.ExamQuestionsUseCase>(
        () => _i510.ExamQuestionsUseCase(gh<_i754.ExamRepository>()));
    gh.factory<_i943.CheckAnswersUseCase>(
        () => _i943.CheckAnswersUseCase(gh<_i754.ExamRepository>()));
    gh.factory<_i461.HomeResultViewModel>(
        () => _i461.HomeResultViewModel(gh<_i30.ResultUseCase>()));
    gh.factory<_i771.ForgetPasswordViewModel>(
        () => _i771.ForgetPasswordViewModel(
              gh<_i826.ForgetPasswordUseCase>(),
              gh<_i693.VerifyResetCodeUseCase>(),
              gh<_i745.ResetPasswordUseCase>(),
            ));
    gh.factory<_i630.RegisterViewModel>(
        () => _i630.RegisterViewModel(gh<_i737.RegisterUseCase>()));
    gh.factory<_i490.ExamQuestionsViewmodel>(
        () => _i490.ExamQuestionsViewmodel(gh<_i510.ExamQuestionsUseCase>()));
    gh.factory<_i65.CheckAnswerViewModel>(
        () => _i65.CheckAnswerViewModel(gh<_i943.CheckAnswersUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i211.ApiModule {}
