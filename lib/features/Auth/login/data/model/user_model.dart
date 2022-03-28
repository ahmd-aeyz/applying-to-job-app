
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntities {
//
// String name;
// String email;
// int id;

  UserModel({required name, required email, required id})
      : super(name: name, email: email, id: id);


  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}