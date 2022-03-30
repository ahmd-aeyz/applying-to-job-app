import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/login_user_entity.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/user_entity.dart';
import 'package:mega_trust_project/features/Auth/domain/repository/auth_repository.dart';

@injectable
class Login extends UseCase<UserEntities, LoginDataEntity> {
  final AuthRepository _authRepository;

  Login(this._authRepository);
  @override
  Future<Either<Failure, UserEntities>> call(LoginDataEntity params) async{
   return await _authRepository.login(password: params.password, email: params.email);


  }


}


