
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_data_model.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi (baseUrl:baseUrl )
@injectable
abstract class ApiService {
  @factoryMethod
  factory ApiService (Dio dio){
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

 @POST ('/appliedJob')
  Future<String> applyJob({
   @Query('user_id') required int userId,
   @Query('job_id') required int jobId,
   @Header("Authorization") required String token,

 });

}