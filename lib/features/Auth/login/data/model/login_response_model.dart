
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_trust_project/features/Auth/login/data/model/user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {

  String token;
  UserModel user;

  LoginResponseModel({required this.token, required this.user});

  factory LoginResponseModel .fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}