class Inscription{
   String _uid;//can't do setters because of final
   String _nom;
   String _tel;
   bool _service1,_service2,_service3;
   String _description;
   bool _disponibilite;
   String _profilepicpath;
   String _password, _email;
  //location, gender, bloodtype ...

 
  String getUid(){
    return this._uid;
  }
  String getNom(){
    return this._nom;
  }
  String getPassword(){
    return this._password;
  }
  String getEmail(){
    return this._email;
  }
  String getTel(){
    return this._tel;
  }
  bool getService1(){
    return this._service1;
  }
  bool getService2(){
    return this._service2;
  }
  bool getService3(){
    return this._service3;
  }
  bool getDisponibilite(){
    return this._disponibilite;
  }
  String getDescription(){
    return this._description;
  }
  String getProfilepicpath(){
    return this._profilepicpath;
  }

  void setUid(String uid){
     this._uid = uid;
  }
  void setNom(String nom){
    this._nom = nom;
  }
  void setPassword(String nom){
    this._password = nom;
  }
  void setEmail(String nom){
    this._email = nom;
  }
  void setTel(String tel){
    this._tel = tel;
  }
  void setService1(bool service1){
    this._service1 = service1;
  }
  void setService2(bool service2){
    this._service2 = service2;
  }
  void setService3(bool service3){
    this._service3 = service3;
  }
  void setDisponibilite(bool disp){
    this._disponibilite = disp;
  }
  void setDescription(String desc){
    this._description = desc;
  }
  void setProfilepicpath(String pic){
    this._profilepicpath = pic;
  }

}