import 'package:mega_trust_project/features/Auth/login/data/model/login_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';
@RestApi (baseUrl:'http://6cf4-154-180-84-54.ngrok.io/api' )

abstract class ApiService{
  factory ApiService (Dio dio, {required String baseUrl}){
    dio.options= BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );
    return _ApiService(dio, baseUrl:baseUrl);
  }

  @POST ('/login')
  Future<LoginModel> login (@Body() Map<String,dynamic> body);



}