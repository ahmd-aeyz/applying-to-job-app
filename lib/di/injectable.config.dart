// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../features/Auth/data/repository/auth_repository_impl.dart' as _i12;
import '../features/Auth/data/services/local_data_source/local_data_source_impl.dart'
    as _i8;
import '../features/Auth/data/services/remote_data_source/api_service.dart'
    as _i5;
import '../features/Auth/data/services/remote_data_source/remote_data_source_impl.dart'
    as _i10;
import '../features/Auth/domain/local_data_source/local_data_source.dart'
    as _i7;
import '../features/Auth/domain/remote_data_source/remote_data_source.dart'
    as _i9;
import '../features/Auth/domain/repository/auth_repository.dart' as _i11;
import '../features/Auth/domain/usecases/is_token_saved.dart' as _i13;
import '../features/Auth/domain/usecases/login_usecase.dart' as _i17;
import '../features/Auth/domain/usecases/logout.dart' as _i19;
import '../features/Auth/domain/usecases/register.dart' as _i20;
import '../features/Auth/presentation/bloc/auth/auth_cubit.dart' as _i23;
import '../features/Auth/presentation/bloc/login/login_cubit.dart' as _i18;
import '../features/Auth/presentation/bloc/register/register_cubit.dart'
    as _i21;
import '../features/list_of_jobs/data/repository/job_repo_impl.dart' as _i15;
import '../features/list_of_jobs/data/services/api_service.dart' as _i6;
import '../features/list_of_jobs/domain/repository/job_rep.dart' as _i14;
import '../features/list_of_jobs/domain/usecases/apply_usecase.dart' as _i22;
import '../features/list_of_jobs/domain/usecases/job_usecase.dart' as _i16;
import '../features/list_of_jobs/presentation/bloc/apply_bloc/apply_cubit.dart'
    as _i25;
import '../features/list_of_jobs/presentation/bloc/job_cubit.dart' as _i24;
import 'dio.dart' as _i26;
import 'shared_prefrence.dart' as _i27; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  final sharedPreferenceModule = _$SharedPreferenceModule();
  gh.factory<_i3.Dio>(() => dioModule.getDio);
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
      preResolve: true);
  gh.factory<_i5.ApiService>(() => _i5.ApiService(get<_i3.Dio>()));
  gh.factory<_i6.ApiService>(() => _i6.ApiService(get<_i3.Dio>()));
  gh.factory<_i7.LocalDataSource>(
      () => _i8.LocalDataSourceImpl(get<_i4.SharedPreferences>()));
  gh.factory<_i9.RemoteDataSource>(
      () => _i10.RemoteDataSourceImpl(get<_i5.ApiService>()));
  gh.factory<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
      get<_i9.RemoteDataSource>(), get<_i7.LocalDataSource>()));
  gh.factory<_i13.GetToken>(() => _i13.GetToken(get<_i11.AuthRepository>()));
  gh.factory<_i14.JobDataRepository>(() => _i15.JobDataRepositoryImpl(
      get<_i6.ApiService>(), get<_i7.LocalDataSource>()));
  gh.factory<_i16.JobsUsercase>(
      () => _i16.JobsUsercase(get<_i14.JobDataRepository>()));
  gh.factory<_i17.Login>(() => _i17.Login(get<_i11.AuthRepository>()));
  gh.factory<_i18.LoginCubit>(() => _i18.LoginCubit(get<_i17.Login>()));
  gh.factory<_i19.Logout>(() => _i19.Logout(get<_i11.AuthRepository>()));
  gh.factory<_i20.Register>(() => _i20.Register(get<_i11.AuthRepository>()));
  gh.factory<_i21.RegisterCubit>(
      () => _i21.RegisterCubit(get<_i20.Register>()));
  gh.factory<_i22.ApplyJob>(() => _i22.ApplyJob(get<_i14.JobDataRepository>()));
  gh.factory<_i23.AuthCubit>(
      () => _i23.AuthCubit(get<_i13.GetToken>(), get<_i19.Logout>()));
  gh.factory<_i24.JobCubit>(() => _i24.JobCubit(get<_i16.JobsUsercase>()));
  gh.factory<_i25.ApplyCubit>(() => _i25.ApplyCubit(get<_i22.ApplyJob>()));
  return get;
}

class _$DioModule extends _i26.DioModule {}

class _$SharedPreferenceModule extends _i27.SharedPreferenceModule {}
