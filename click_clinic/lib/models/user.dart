//my custom user
class User {

  final  String uid;

  User({this.uid});

}
//fill in next with private attributes
class UserData {

  final String uid;//can't do setters because of final
  final String nom;
  final String tel;
  final bool service1,service2,service3;
  final String description;
  final bool disponibilite;
  final String profilepicpath;
  final location;
  final String adresse;
  final String bloodtype;

  UserData({this.uid, this.nom, this.tel, this.service1,this.adresse,this.bloodtype,this.location, 
  this.service2, this.service3, this.description, this.disponibilite, this.profilepicpath});
}