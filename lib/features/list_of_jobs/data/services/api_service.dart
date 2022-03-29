
import 'package:dio/dio.dart';
import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_data_model.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi (baseUrl:baseUrl )

abstract class ApiService {
  factory ApiService (Dio dio, { String? baseUrl}){
     dio.options = BaseOptions(

       // headers: {"Accept":"application/json",
       // "Authorization":"Bearer 13|XFvb11GWyTk6c9b4eAr5vHoryRgc9NdBdD95CyNS"}
    );

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/jobs')
  Future<JobModel> getJobs({
  @Header("Authorization") required String token,
});


}