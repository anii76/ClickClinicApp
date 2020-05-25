//my custom user
class User {

  final  String uid;

  User({this.uid});

}
//fill in next
class UserData {

  final String uid;
  final String nom;
  final String tel;
  final bool service1,service2,service3;
  final String description;
  final bool disponibilite;
  final String profilepicpath;

  UserData({this.uid, this.nom, this.tel, this.service1, 
  this.service2, this.service3, this.description, this.disponibilite, this.profilepicpath});
}