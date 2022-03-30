import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/Auth/data/models/login_model/login_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/response_model/response_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/user_model/user_model.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/register_input_data.dart';
import 'package:mega_trust_project/features/Auth/domain/local_data_source/local_data_source.dart';
import 'package:mega_trust_project/features/Auth/domain/remote_data_source/remote_data_source.dart';


import '../../domain/entitiy/user_entity.dart';
import '../../domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource _remoteDataSource;

  final LocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, UserEntities>> login(
      {required String email, required String password}) async {
    final LoginModel loginModel = LoginModel(email: email, password: password);
    try {
      final ResponseModel response =
          (await _remoteDataSource.login(loginModel));
      print('response fom repo $response');
      await _localDataSource.saveUserData(
          token: 'Bearer ' + response.token, userId: response.user.id);

      return Right(response.user);
    } catch (e) {
      print('exception from login $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntities>> register(
      RegisterInputData registerData) async {
    try {
      final RegisterModel registerInputModel = RegisterModel(
          email: registerData.email,
          name: registerData.name,
          password: registerData.password,
          passwordConfirmation: registerData.passwordConfirmation);
      final ResponseModel response =
          await _remoteDataSource.register(registerInputModel);
      final UserModel result = response.user;
      await _localDataSource.saveUserData(
          token: 'Bearer ' + response.token, userId: response.user.id);

      print(
          'response register is ${response.user.toJson()} ,token is : ${response.token}');
      return (right(result));
    } catch (e) {
      print('error $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getTokenData() async {
    try {
      final String? result = await _localDataSource.getToken();
      return right(result);
    } catch (e) {
      print('error $e');
      return left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int?>> getUserIdData() async {
    try {
      final int? result = await _localDataSource.getUserId();
      return right(result);
    } catch (e) {
      print('error $e');
      return left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveLocalData(
      {required int userId, required String token}) async {
    try {
      final bool isSaved =
          await _localDataSource.saveUserData(token: token, userId: userId);
      return right(isSaved);
    } catch (e) {
      return left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeUserData() async {
    try{
      final bool isRemoved = await _localDataSource.removeUserData();
      return right(isRemoved);
    }catch(e){
      return left(CacheFailure(e.toString()));
    }
  }
}
