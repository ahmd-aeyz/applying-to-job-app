
import 'package:freezed_annotation/freezed_annotation.dart';


part 'register_model.g.dart';
@JsonSerializable()

class RegisterModel  {


  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;


  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;






  RegisterModel({required this.email, required this.name, required this.password, required this.passwordConfirmation})
       ;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson () =>_$RegisterModelToJson(this);





}