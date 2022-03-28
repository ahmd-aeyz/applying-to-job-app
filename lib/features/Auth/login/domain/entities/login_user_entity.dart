class LoginDataEntity{
  String email;
  String password;

  LoginDataEntity({required this.email, required this.password});

 get props =>[email, password];
}