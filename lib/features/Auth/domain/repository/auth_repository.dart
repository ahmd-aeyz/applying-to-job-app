
import 'package:dartz/dartz.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/user_entity.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/register_input_data.dart';

abstract class AuthRepository {
  Future<Either<Failure,UserEntities>> login({required String email, required String password});
  Future<Either<Failure,UserEntities>> register(RegisterInputData registerData);
  Future<Either<Failure,String?>> getTokenData();
  Future<Either<Failure,int?>> getUserIdData();
  Future<Either<Failure,bool>> saveLocalData({required int userId, required String token});
  Future<Either<Failure, bool>> removeUserData();



}