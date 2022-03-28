class LoginData{
   String? email;
  String? password;
  String? token;

LoginData({this.password, this.email, this.token});

 get props =>[email, password, token];
}