import 'package:dartz/dartz.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/login/domain/entities/login.dart';
import 'package:mega_trust_project/features/Auth/login/domain/repository/LoginDataRepository.dart';

class GetLogin {

  final LoginDataRepository loginRepository;

  GetLogin(this.loginRepository);

  Future <Either<Failure,LoginData>> excute({
  required String email, required String password,
}) async {
    return await loginRepository.getLogin(email, password);
  }
}