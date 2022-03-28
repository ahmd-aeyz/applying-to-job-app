
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/registeration_input_entity.dart';

part 'user_registeration_model.g.dart';
@JsonSerializable()

class RegisterInputModel  {


  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;


  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;






  RegisterInputModel({required this.email, required this.name, required this.password, required this.passwordConfirmation})
       ;

  factory RegisterInputModel.fromJson(Map<String, dynamic> json) => _$RegisterInputModelFromJson(json);
  Map<String, dynamic> toJson () =>_$RegisterInputModelToJson(this);





}