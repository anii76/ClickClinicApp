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
  //location, gender, bloodtype ...

  UserData({this.uid, this.nom, this.tel, this.service1, 
  this.service2, this.service3, this.description, this.disponibilite, this.profilepicpath});

 
  String getUid(){
    return this.uid;
  }
  String getNom(){
    return this.nom;
  }
  String getTel(){
    return this.tel;
  }
  bool getService1(){
    return this.service1;
  }
  bool getService2(){
    return this.service2;
  }
  bool getService3(){
    return this.service3;
  }
  bool getDisponibilite(){
    return this.disponibilite;
  }
  String getDescription(){
    return this.description;
  }
  String getProfilepicpath(){
    return this.profilepicpath;
  }
}