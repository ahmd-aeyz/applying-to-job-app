import '../../data/model/user_registeration_model.dart';

class RegisterationInputEntities{

  String name;
  String password;
  String passwordConfirmation;
  String email;

  RegisterationInputEntities({required this.email, required this.name, required this.password, required this.passwordConfirmation});
  get props =>[name, email,password, passwordConfirmation];




}