
class Etablissment {
  
  String _id; //document id
  String _nom;
  String _adresse;
  String _tel; 
  Map _location;
  String _picUrl; //opt

  Etablissment();

  //setters
  void setId(String id){
    this._id = id;
  }
  void setNom(String nom){
    this._nom = nom;
    print("nom"+ nom);
    print("_nom"+_nom);
  }
  void setAdresse(String adresse){
    this._adresse = adresse;
  }
  void setTel(String tel){
    this._tel = tel;
  }
  void setPicUrl(String picUrl){
    this._picUrl = picUrl;
  }
  void setLocation(Map location){
    this._location = location;
  }

  //getters
  String getId(){
    return this._id;
  }
  String getNom(){
    return this._nom;
  }
  String getAdresse(){
    return this._adresse;
  }
  String getTel(){
    return this._tel;
  }
  String getPicUrl(){
    return this._picUrl;
  }
  Map getLocation(){
    return this._location;
  }

}

//Doctor Model
class Doctor {
  final String adresse;
  final String name;
  final String speciality;
  final String tel;
  final Map location;

  Doctor({this.adresse,this.name,this.speciality,this.location,this.tel}); 
}

//Hopital Model
class Hospital extends Etablissment{
  
  String _proprietaire;

  Hospital();

  //setters
  void setProprietaire(String prop){
    this._proprietaire = prop;
  }
  //getters
  String getProprietaire(){
    return this._proprietaire;
  }

}

//Pharmacie Model
class Pharmacie extends Etablissment{
  
  String _proprietaire;
  String _horaire;

  Pharmacie();

  //setters
  void setProprietaire(String prop){
    this._proprietaire = prop;
  }
  void setHoraire(String horaire){
    this._horaire = horaire;
  }

  //getters
  String getProprietaire(){
    return this._proprietaire;
  }
  String getHoraire(){
    return this._horaire;
  }
}

//Laboratoire Model
class Laboratoire extends Etablissment{
  
  String _proprietaire;
  String _horaire;

  Laboratoire();

  //setters
  void setProprietaire(String prop){
    this._proprietaire = prop;
  }
  void setHoraire(String horaire){
    this._horaire = horaire;
  }

  //getters
  String getProprietaire(){
    return this._proprietaire;
  }
  String getHoraire(){
    return this._horaire;
  }
}

//Parapharmacie Model
class Parapharmacie extends Etablissment{
  
  String _proprietaire;
  String _horaire;

  Parapharmacie();

  //setters
  void setProprietaire(String prop){
    this._proprietaire = prop;
  }
  void setHoraire(String horaire){
    this._horaire = horaire;
  }

  //getters
  String getProprietaire(){
    return this._proprietaire;
  }
  String getHoraire(){
    return this._horaire;
  }
}

//Imagerie Model
class Imagerie extends Etablissment{
  
  String _proprietaire;
  String _horaire;

  Imagerie();

  //setters
  void setProprietaire(String prop){
    this._proprietaire = prop;
  }
  void setHoraire(String horaire){
    this._horaire = horaire;
  }

  //getters
  String getProprietaire(){
    return this._proprietaire;
  }
  String getHoraire(){
    return this._horaire;
  }
}

//Opticien Model
class Opticien extends Etablissment{
  
  String _proprietaire;
  String _horaire;

  Opticien();

  //setters
  void setProprietaire(String prop){
    this._proprietaire = prop;
  }
  void setHoraire(String horaire){
    this._horaire = horaire;
  }

  //getters
  String getProprietaire(){
    return this._proprietaire;
  }
  String getHoraire(){
    return this._horaire;
  }
}