import 'package:mega_trust_project/features/Auth/login/domain/entities/login.dart';



// @JsonSerializable()
// class LoginResponse{
//   @JsonKey(name: 'email')
//   final String email;
//
//   @JsonKey(name: 'password')
//   final String password;
//
//   LoginResponse({required this.email, required this.password})
//
//
//   factory LoginResponse.fromJson(Map<String, dynamic> json) =>
//       _$LoginResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
//
// }

class LoginModel extends LoginData {
  LoginModel({
    required String email,
    required String password,
    required String token ,
  });

  get props => [email, password];

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

