
class RegisterInputData{

  String name;
  String password;
  String passwordConfirmation;
  String email;

  RegisterInputData({required this.email, required this.name, required this.password, required this.passwordConfirmation});
  get props =>[name, email,password, passwordConfirmation];




}