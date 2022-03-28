
import 'package:get_it/get_it.dart';
import 'package:mega_trust_project/features/Auth/register/data/repository/RegisterDataRepositoryImp.dart';
import 'package:mega_trust_project/features/Auth/register/domain/repository/RegisterDataRepository.dart';
import 'package:mega_trust_project/features/Auth/register/domain/usecases/register.dart';
import 'package:mega_trust_project/features/Auth/register/presentation/bloc/register_cubit.dart';

import 'package:mega_trust_project/features/list_of_jobs/data/repository/job_repo_impl.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/repository/job_rep.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/usecases/job_usecase.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/job_cubit.dart';

import 'features/list_of_jobs/domain/usecases/job_usecase.dart';

/// Global GetIt instance
GetIt getIt = GetIt.instance;

Future<void> initLocator()async{

  ///Repository
  getIt.registerLazySingleton<JobDataRepository>(() => JobDataRepositoryImpl());

  //
  getIt.registerLazySingleton<RegisterDataRepository>(() => RegisterDataRepositoryImpl());

  ///UserCases
  getIt.registerLazySingleton(() => JobsUsercase(
    getIt.get<JobDataRepository>()
  ));
  getIt.registerLazySingleton(() => Register(getIt.get<RegisterDataRepository>()));

  ///Bloc

  getIt.registerLazySingleton(() =>  JobCubit(
    getIt()
  ));

  getIt.registerFactory(() => RegisterCubit(getIt()));

  
  


}