
import 'package:mega_trust_project/features/Auth/data/models/login_model/login_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/response_model/response_model.dart';

abstract class RemoteDataSource {
  Future<ResponseModel> register (RegisterModel registerModel);
  Future<ResponseModel> login (LoginModel loginModel);

}