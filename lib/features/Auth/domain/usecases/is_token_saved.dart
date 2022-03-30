import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/Auth/domain/repository/auth_repository.dart';

@injectable
class GetToken extends UseCase<String?, NoParams>{
  final AuthRepository _authRepository;
  GetToken(this._authRepository);
  @override
  Future<Either<Failure, String?>> call(NoParams params) async{
    return await _authRepository.getTokenData();
  }

}