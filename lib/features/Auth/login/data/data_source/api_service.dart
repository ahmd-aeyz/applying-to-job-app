import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_model.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_response_model.dart';
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

  @POST ('/login')
  Future<LoginResponseModel> login (@Body() LoginModel loginModel);



}