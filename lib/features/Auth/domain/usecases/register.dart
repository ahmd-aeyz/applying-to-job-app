
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/user_entity.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/register_input_data.dart';
import 'package:mega_trust_project/features/Auth/domain/repository/auth_repository.dart';

@injectable
class Register extends UseCase<UserEntities , RegisterInputData>{
  final AuthRepository _authRepository;

  Register(this._authRepository);
  @override
  Future<Either<Failure, UserEntities>> call(RegisterInputData params) async{

    return await _authRepository.register(params);


  }



}