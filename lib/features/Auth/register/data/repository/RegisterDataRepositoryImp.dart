import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/register/data/data_source/services/api_service.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/register_model.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/user_model.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/user_registeration_model.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/registeration_input_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/RegisterDataRepository.dart';

class RegisterDataRepositoryImpl implements RegisterDataRepository{

  final ApiService apiService =ApiService(Dio(),  );

  @override
  Future<Either<Failure, UserEntities>> register(RegisterationInputEntities registerData) async{
    try {
      final RegisterInputModel registerInputModel= RegisterInputModel(email: registerData.email, name:registerData.name,
          password: registerData.password, passwordConfirmation: registerData.passwordConfirmation);
      final RegisterResponseModel response= await apiService.register(registerInputModel);
      final UserModel result = response.user;

      print('response register is ${response.user.toJson()} ,token is : ${response.token}');
      return(  Right(result));
    } catch (e) {
      print('error $e');
      return left(CacheFailure(e.toString()));
    }



  }




 }


















