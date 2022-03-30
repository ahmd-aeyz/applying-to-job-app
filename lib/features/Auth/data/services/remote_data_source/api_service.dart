
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/features/Auth/data/models/login_model/login_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/response_model/response_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';
@RestApi (baseUrl:baseUrl )

@injectable
abstract class ApiService{
  @factoryMethod
  factory ApiService (Dio dio){

    return _ApiService(dio,);
  }
  @POST ('/register')
   Future<ResponseModel> register (@Body() RegisterModel registerModel);

  @POST ('/login')
  Future<ResponseModel> login (@Body() LoginModel loginModel);

}


