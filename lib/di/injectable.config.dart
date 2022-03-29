// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../features/Auth/login/data/data_source/api_service.dart' as _i5;
import '../features/Auth/login/data/repository/LoginRepositoryImplementation.dart'
    as _i12;
import '../features/Auth/login/domain/repository/LoginDataRepository.dart'
    as _i11;
import '../features/Auth/login/domain/usecases/login_usecase.dart' as _i17;
import '../features/Auth/login/presentation/bloc/login_cubit.dart' as _i18;
import '../features/Auth/register/data/data_source/services/api_service.dart'
    as _i6;
import '../features/Auth/register/data/repository/RegisterDataRepositoryImp.dart'
    as _i14;
import '../features/Auth/register/domain/repository/RegisterDataRepository.dart'
    as _i13;
import '../features/Auth/register/domain/usecases/register.dart' as _i19;
import '../features/Auth/register/presentation/bloc/register_cubit.dart'
    as _i20;
import '../features/list_of_jobs/data/repository/job_repo_impl.dart' as _i9;
import '../features/list_of_jobs/data/services/api_service.dart' as _i7;
import '../features/list_of_jobs/domain/repository/job_rep.dart' as _i8;
import '../features/list_of_jobs/domain/usecases/apply_usecase.dart' as _i15;
import '../features/list_of_jobs/domain/usecases/job_usecase.dart' as _i10;
import '../features/list_of_jobs/presentation/bloc/apply_bloc/apply_cubit.dart'
    as _i21;
import '../features/list_of_jobs/presentation/bloc/job_cubit.dart' as _i16;
import 'dio.dart' as _i22;
import 'shared_prefrence.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  final sharedPrefrenceModule = _$SharedPrefrenceModule();
  gh.factory<_i3.Dio>(() => dioModule.prefs);
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => sharedPrefrenceModule.prefs,
      preResolve: true);
  gh.factory<_i5.ApiService>(
      () => _i5.ApiService(get<_i3.Dio>(), get<String>()));
  gh.factory<_i6.ApiService>(
      () => _i6.ApiService(get<_i3.Dio>(), baseUrl: get<String>()));
  gh.factory<_i7.ApiService>(
      () => _i7.ApiService(get<_i3.Dio>(), baseUrl: get<String>()));
  gh.factory<_i8.JobDataRepository>(
      () => _i9.JobDataRepositoryImpl(get<_i7.ApiService>()));
  gh.factory<_i10.JobsUsercase>(
      () => _i10.JobsUsercase(get<_i8.JobDataRepository>()));
  gh.factory<_i11.LoginDataRepository>(
      () => _i12.LoginDataRepositoryImpl(get<_i5.ApiService>()));
  gh.factory<_i13.RegisterDataRepository>(
      () => _i14.RegisterDataRepositoryImpl(get<_i6.ApiService>()));
  gh.factory<_i15.ApplyJob>(() => _i15.ApplyJob(get<_i8.JobDataRepository>()));
  gh.factory<_i16.JobCubit>(() => _i16.JobCubit(get<_i10.JobsUsercase>()));
  gh.factory<_i17.Login>(() => _i17.Login(get<_i11.LoginDataRepository>()));
  gh.factory<_i18.LoginCubit>(() => _i18.LoginCubit(get<_i17.Login>()));
  gh.factory<_i19.Register>(
      () => _i19.Register(get<_i13.RegisterDataRepository>()));
  gh.factory<_i20.RegisterCubit>(
      () => _i20.RegisterCubit(get<_i19.Register>()));
  gh.factory<_i21.ApplyCubit>(() => _i21.ApplyCubit(get<_i15.ApplyJob>()));
  return get;
}

class _$DioModule extends _i22.DioModule {}

class _$SharedPrefrenceModule extends _i23.SharedPrefrenceModule {}
