

import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/features/Auth/domain/local_data_source/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource{
  final String token='token';
  final String userId='userId';
  final SharedPreferences _preferences;
  LocalDataSourceImpl(this._preferences);
  @override
  Future<String?> getToken()async {
    return  _preferences.getString(token);
  }

  @override
  Future<int?> getUserId() async{
    return  _preferences.getInt(userId);

  }

  @override
  Future<bool> removeUserData() async{
   bool removeToken= await  _preferences.remove(token);
   bool removeUserId= await  _preferences.remove(userId);
   return removeToken && removeUserId ;
  }

  @override
  Future<bool> saveUserData({required String token, required int userId}) async {
   bool  saveToken = await _preferences.setString(this.token, token);
   bool  saveUserId = await _preferences.setInt(this.userId, userId);
   return saveToken&& saveUserId;
  }

}