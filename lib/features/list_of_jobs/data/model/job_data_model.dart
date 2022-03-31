import 'package:flutter/material.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/entities/job_entities.dart';

class JobDataModel {
  int id;
  String jobName;
  String description;
  String publishedDate;

  JobDataModel(
      {required this.jobName, required this.description, required this.publishedDate, required this.id});

  factory JobDataModel.fromJson(Map<String, dynamic> json) {
    return JobDataModel(
      jobName: json['JobName'] as String,
      description: json['Description'] as String,
      publishedDate: json['Published_Date'] as String ,
      id: json['id'] as int,
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'JobName': jobName,
      'Description': description,
      'Published Date': publishedDate,
    };
  }

  JobData mapper() {
    print('to json:${toJson()}');

    final JobData mapperData = JobData(
        title: jobName,
        jobDescription: description,
        publishDate: publishedDate,
        id: id, );

    print('mapper data is : ${mapperData.title}');
    return mapperData;

  }
  // JobDataModel jobMapper(){
  //   return JobDataModel(
  //       jobName: jobName,
  //       description: description,
  //       publishedDate: publishedDate,
  //       id: id);
  // }
}
