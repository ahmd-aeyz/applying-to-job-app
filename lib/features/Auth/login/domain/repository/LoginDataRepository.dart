
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/login/domain/entities/login_user_entity.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/user_entity.dart';

abstract class LoginDataRepository {
  Future<Either<Failure,UserEntities>> login({required String email, required String password});


}