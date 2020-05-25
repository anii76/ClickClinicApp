

class Etabli {
  
  final int id; //or str
  final String nom;
  final String adresse;
  final String tel;
  final double lat;
  final double long;

  Etabli({this.id, this.nom, this.adresse, this.tel, this.lat, this.long});
}

class Doctor extends Etabli{
  
  final int id; //or str
  final String nom;
  final String specialite;
  final String adresse;
  final String tel;
  final double lat;
  final double long;
  final String horaire;

  Doctor({this.id, this.nom, this.specialite, this.adresse, this.tel, this.lat, this.long, this.horaire});
}

class Hospital extends Etabli{
  
  final int id; //or str
  final String nom;
  final String owner; //since we don't have specialities
  final String specialites;
  final String adresse;
  final String tel;
  final double lat;
  final double long;

  Hospital({this.id, this.nom, this.owner, this.specialites, this.adresse, this.tel, this.lat, this.long});
}

class Phar extends Etabli{
  
  final int id; //or str
  final String nom;
  final String proprietaire;
  final String adresse;
  final String tel; //add more maybe
  final double lat;
  final double long;
  final String horaire;

  Phar({this.id, this.nom, this.proprietaire, this.adresse, this.tel, this.lat, this.long, this.horaire});
}