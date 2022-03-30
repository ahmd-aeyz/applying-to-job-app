import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/features/Auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_project/features/Auth/data/models/response_model/response_model.dart';
import 'package:mega_trust_project/features/Auth/data/services/remote_data_source/api_service.dart';
import 'package:mega_trust_project/features/Auth/domain/remote_data_source/remote_data_source.dart';

import '../../models/login_model/login_model.dart';
@Injectable(as:  RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService _apiService;
  RemoteDataSourceImpl(this._apiService);

  @override
  Future<ResponseModel> login(LoginModel loginModel) async{
    return await _apiService.login(loginModel);
  }

  @override
  Future<ResponseModel> register(RegisterModel registerModel) async {
    return await _apiService.register(registerModel);

  }
}