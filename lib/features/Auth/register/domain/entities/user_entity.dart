
class UserEntities{
  String email;
  String name;
  int id;

  UserEntities({required this.name, required this.email, required this.id});

  get props =>[name, email, id];

}