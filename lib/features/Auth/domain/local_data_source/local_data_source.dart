

abstract class LocalDataSource{

  Future< bool> saveUserData({ required String token,required  int userId});
  Future<String?> getToken();
  Future<int?> getUserId();
  Future<bool> removeUserData();

}