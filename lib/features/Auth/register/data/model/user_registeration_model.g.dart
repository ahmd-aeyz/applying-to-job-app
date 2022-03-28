// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registeration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInputModel _$RegisterInputModelFromJson(Map<String, dynamic> json) =>
    RegisterInputModel(
      email: json['email'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$RegisterInputModelToJson(RegisterInputModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
