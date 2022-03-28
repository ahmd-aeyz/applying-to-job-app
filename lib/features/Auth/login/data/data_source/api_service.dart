import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_model.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_response_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';
@RestApi (baseUrl:baseUrl )

abstract class ApiService{
  factory ApiService (Dio dio, String baseUrl){

    return _ApiService(dio, baseUrl:baseUrl);
  }

  @POST ('/login')
  Future<LoginResponseModel> login (@Body() LoginModel loginModel);



}