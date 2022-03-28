

import 'package:dartz/dartz.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/login/data/data_source/api_service.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/login_response.dart';
import 'package:mega_trust_project/features/Auth/login/domain/entities/login.dart';
import 'package:mega_trust_project/features/Auth/login/domain/repository/LoginDataRepository.dart';

class LoginDataRepositoryImpl implements LoginDataRepository{
  
  @override
  late final ApiService response;
  Future<Either<Failure, LoginData>> getLogin(String email, String password) async{
   return Right( await response.login({
     "email":email,
     "password":password
   }) );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
  
  
}