
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/register_entity.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/registeration_input_entity.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/user_entity.dart';


abstract class RegisterDataRepository  {
  Future<Either<Failure,UserEntities>> register(RegisterationInputEntities registerData);

}