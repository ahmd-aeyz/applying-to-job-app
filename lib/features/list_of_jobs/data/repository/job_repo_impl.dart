
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/entities/job_entities.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/repository/job_rep.dart';


import '../model/job_data_model.dart';
import '../model/job_model.dart';
import '../services/api_service.dart';

class JobDataRepositoryImpl implements JobDataRepository{
   final ApiService apiService =ApiService(Dio() );
  @override
  Future<Either<Failure, List <JobData>>> getJob() async{
    try {
      final  JobModel messageresult= await apiService.getJobs(token: token);
      print('message is '+ messageresult.toString());
      final List<JobDataModel> result = messageresult.jobData;
      print('result is: $result');
      final  List<JobData> jobs= result.map((jobDataModel) => jobDataModel.mapper()).toList();
      print('jobs is ${jobs.length}');
      return Right( jobs);
    } catch (e) {
      print('error $e');
      return left(CacheFailure(e.toString()));
    }

  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();

}