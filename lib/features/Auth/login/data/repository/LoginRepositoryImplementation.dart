

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/const/constant.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/login/data/data_source/api_service.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_model.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_response_model.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/user_model.dart';
import 'package:mega_trust_project/features/Auth/login/domain/entities/login_user_entity.dart';
import 'package:mega_trust_project/features/Auth/login/domain/repository/LoginDataRepository.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/user_entity.dart';

import '../../../register/data/model/register_model.dart';


@Injectable(as: LoginDataRepository)
class LoginDataRepositoryImpl implements LoginDataRepository{

  final ApiService apiService ;

  LoginDataRepositoryImpl(this.apiService);
  @override
  Future<Either<Failure, UserEntities>> login({required String email, required String password}) async {
    final LoginModel loginModel = LoginModel(email: email, password: password);
    try{
      final LoginResponseModel response= (await apiService.login(loginModel));
      print ('response fom repo $response');
      token=  'Bearer '+ response.token;
      userId= response.user.id;
       return Right(response.user);

    } catch(e){
      print ( 'exception from login $e');
      return left(ServerFailure(e.toString()));
    }

  }

}