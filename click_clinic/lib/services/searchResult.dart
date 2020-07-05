import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:click_clinic/models/etablissment.dart';

class TrouverEtablissement{ //rendre abstract
  
  final String id; 
  final CollectionReference collectionReference;//or nom
  String etablis;
  
  TrouverEtablissement({this.id, this.collectionReference, this.etablis});

  displayDetails(){

    try{var doc ;
    this.collectionReference.document(this.id).get().then((value){
      doc = value.data;
      print(value.data);
      print(id);
      if (doc["Owner"] != null) {
      etablis = 'Etablis';
      return FindLaboratoire(this.id, this.collectionReference).laboratoire;
    }else if (doc["Speciality"] == 'Pharmacien') {
      etablis = 'Pharmacie';
      return FindPharmacie(this.id).pharmacie;
    }else {
      etablis = 'Doctor';
      return FindDoctor(this.id, this.collectionReference).doctor;
    }
    });

    }catch(e){
      print(e);
      etablis = 'Doctor';
      return FindDoctor(this.id, this.collectionReference).doctor;
    }
  }
  
  displayEtablis(){

    switch (etablis) {
      case  'Doctor':
        return Doctor();
      case'Pharmacie':
        return Pharmacie();
        break;
      default: return Laboratoire();
    }
  }

} 

//getting doctors by sp is in medecins page
//display when pressing on doctor marker 
class FindDoctor {
  
  final String id; //or nom
  final CollectionReference doctorCollection ;

  FindDoctor(this.id, this.doctorCollection);

  //get all doctor data
  Doctor _doctorDataFromSnapshot(DocumentSnapshot snapshot){
    Doctor /*doctor;
    /*print('here');
     String nom = snapshot.data["Name"];
    doctor.setNom(nom);*/
    print('done');
    doctor.setAdresse(snapshot.data["Adress"]);
    doctor.setTel(snapshot.data["Phone number"]);
    doctor.setSpecialite(snapshot.data["Speciality"]);
    doctor.setLocation(snapshot.data["Location"]);
    return doctor ;*/(
      adresse: snapshot.data["Adress"],
      name: snapshot.data["Name"],
      speciality: snapshot.data["Speciality"],
      tel: snapshot.data["Phone number"],
      location: snapshot.data["Location"],
      );
  }
  //get doctor stream
  Stream<Doctor> get doctor {
    return doctorCollection.document(id).snapshots()
    .map(_doctorDataFromSnapshot);
  }

}

//getting etabli by name in etabli page ..
class FindPharmacie {
  
  final String id; //or nom
  final CollectionReference doctorCollection = Firestore.instance.collection("pharmacies"); //reupdate

  FindPharmacie(this.id);

  //get all data
  Pharmacie _pharmacieDataFromSnapshot(DocumentSnapshot snapshot){
    Pharmacie pharmacie;
    pharmacie.setNom(snapshot.data[""]);
    pharmacie.setAdresse(snapshot.data[""]);
    pharmacie.setTel(snapshot.data[""]);
    pharmacie.setProprietaire(snapshot.data[""]);
    pharmacie.setLocation(snapshot.data["Location"]);
    return pharmacie ;
  }
  //get stream
  Stream<Pharmacie>get pharmacie {
    return doctorCollection.document(id).snapshots()
    .map(_pharmacieDataFromSnapshot);
  }
}

//getting etabli by name in etabli page ..
class FindLaboratoire {
  
  final String id; //or nom
  final CollectionReference doctorCollection ; //reupdate

  FindLaboratoire(this.id, this.doctorCollection);

  //get all data
  Laboratoire _laboratoireDataFromSnapshot(DocumentSnapshot snapshot){
    Laboratoire laboratoire;
    laboratoire.setNom(snapshot.data[""]);
    laboratoire.setAdresse(snapshot.data[""]);
    laboratoire.setTel(snapshot.data[""]);
    laboratoire.setProprietaire(snapshot.data[""]);
    laboratoire.setLocation(snapshot.data["Location"]);
    return laboratoire ;
  }
  //get stream
  Stream<Laboratoire>get laboratoire {
    return doctorCollection.document(id).snapshots()
    .map(_laboratoireDataFromSnapshot);
  }
}

//FindOpticien
//FindHopital
//FindParapharmacie
//FindImagerie