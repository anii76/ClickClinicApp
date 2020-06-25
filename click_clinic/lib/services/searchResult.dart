import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:click_clinic/models/etablissment.dart';

class TrouverEtablissement{ //rendre abstract
  
  final String id; //or nom
  
  TrouverEtablissement({this.id});

} 

//getting doctors by sp is in medecins page
//display when pressing on doctor marker 
class FindDoctor extends TrouverEtablissement{
  
  final String id; //or nom
  final CollectionReference doctorCollection ;

  FindDoctor(this.id, this.doctorCollection);

  //get all doctor data
  Doctor _doctorDataFromSnapshot(DocumentSnapshot snapshot){
    Doctor doctor;
    doctor.setNom(snapshot.data["Name"]);
    doctor.setAdresse(snapshot.data["Adress"]);
    doctor.setTel(snapshot.data["Phone number"]);
    doctor.setSpecialite(snapshot.data["Speciality"]);
    doctor.setLocation(snapshot.data["Location"]);
    return doctor ;
  }
  //get doctor stream
  Stream<Doctor> get doctor {
    return doctorCollection.document(id).snapshots()
    .map(_doctorDataFromSnapshot);
  }

}

//getting etabli by name in etabli page ..
class FindPharmacie extends TrouverEtablissement{
  
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
class FindLaboratoire extends TrouverEtablissement{
  
  final String id; //or nom
  final CollectionReference doctorCollection = Firestore.instance.collection("laboratoires"); //reupdate

  FindLaboratoire(this.id);

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