import 'package:mega_trust_project/features/list_of_jobs/data/model/job_data_model.dart';

import '../../domain/entities/job_entities.dart';

class JobModel {
  final String message;
  final List<JobDataModel> jobData;

  JobModel({
   required this.message,
   required this.jobData,
  });

  get props => [];


  factory JobModel.fromJson(Map<String, dynamic> json) {
    print(json);

    final result =JobModel(
      message : json['Message'] as String,
      jobData: job(json['data'] as List<dynamic>) ,
    );
    print(result);
    return result;
  }

}
List <JobDataModel> job (List< dynamic>json){
   List<JobDataModel> jobData=[];
  print( 'job method: $json');
  for( int index = 0; index < json.length; index ++ ){
    final map = json[index] as Map<String, dynamic>;
    print( 'job map ${json.length}: $map');
    jobData.add(JobDataModel.fromJson(map));
    print( 'job dataIndex $index : ${jobData[index]} ');
  }
  return jobData;
}