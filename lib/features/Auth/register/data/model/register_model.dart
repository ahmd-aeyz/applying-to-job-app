
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_trust_project/features/Auth/register/data/model/user_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {

  String token;
  UserModel user;

  RegisterResponseModel({required this.token, required this.user});

  factory RegisterResponseModel .fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);




}