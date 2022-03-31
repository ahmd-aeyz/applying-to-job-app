
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_trust_project/features/Auth/data/models/user_model/user_model.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {

  String token;
  UserModel user;

 ResponseModel({required this.token, required this.user});

  factory ResponseModel .fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
}