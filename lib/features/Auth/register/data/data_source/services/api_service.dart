import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/register_model.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/user_registeration_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';



part 'api_service.g.dart';
@RestApi (baseUrl:baseUrl )

abstract class ApiService{
  factory ApiService(Dio dio, { String? baseUrl}){

    return _ApiService(dio, baseUrl:baseUrl);
  }

  @POST ('https://laravel-job-api.herokuapp.com/api/register')
  Future<RegisterResponseModel> register (@Body() RegisterInputModel registerInputModel);



}