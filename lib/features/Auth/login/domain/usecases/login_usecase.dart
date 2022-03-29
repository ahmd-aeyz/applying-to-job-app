import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/Auth/login/domain/entities/login_user_entity.dart';
import 'package:mega_trust_project/features/Auth/login/domain/repository/LoginDataRepository.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/user_entity.dart';

@injectable
class Login extends UseCase<UserEntities, LoginDataEntity> {
  final LoginDataRepository loginDataRepository;

  Login(this.loginDataRepository);
  @override
  Future<Either<Failure, UserEntities>> call(LoginDataEntity params) async{
   return await loginDataRepository.login(password: params.password, email: params.email);

  }


}


// final LoginDataRepository loginRepository;
//
// Login(this.loginRepository);
//
// Future <Either<Failure,LoginDataEntity>> excute({
//   required String email, required String password,
// }) async {
//   return await loginRepository.getLogin(email, password);
// }