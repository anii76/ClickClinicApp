import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  // collection reference 
  final CollectionReference benevoleCollection = Firestore.instance.collection('Benevole');

  Future updateUserData({String nom, String tel, String wilaya, bool service1, bool service2, bool service3, String description, bool disponibilite}) async {
    return await benevoleCollection.document(uid).setData({
      'Nom': nom,
      'Tel': tel,
      'Wilaya': wilaya, 
      'Service1': service1,
      'Service2': service2,
      'Service3': service3,
      'Description': description, //autres services
      //'Location': needs maps Api 
      'Disponibilite': disponibilite,

    });
  }

  //get benevole stream
  Stream<QuerySnapshot> get benevole {
    return benevoleCollection.snapshots();
  } 

}