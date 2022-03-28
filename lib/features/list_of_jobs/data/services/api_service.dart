
import 'package:dio/dio.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_data_model.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi (baseUrl:'https://0a20-154-180-84-54.ngrok.io/api' )

abstract class ApiService {
  factory ApiService (Dio dio, {required String baseUrl}){

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/jobs')
  Future<JobModel> getJobs();

}