import 'package:mega_trust_project/features/Auth/register/data/model/register_model.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/user_registeration_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';



part 'api_service.g.dart';
@RestApi (baseUrl:'https://0a20-154-180-84-54.ngrok.io/api' )

abstract class ApiService{
  factory ApiService(Dio dio, { String? baseUrl}){

    return _ApiService(dio, baseUrl:baseUrl);
  }

  @POST ('/register')
  Future<RegisterResponseModel> register (@Body() RegisterInputModel registerInputModel);



}