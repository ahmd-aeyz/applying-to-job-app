
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/login/domain/entities/login.dart';

abstract class LoginDataRepository extends Equatable{
  Future<Either<Failure,LoginData>> getLogin(String email, String password);


}