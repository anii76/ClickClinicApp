import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:click_clinic/benevole/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  // collection reference 
  final CollectionReference benevoleCollection = Firestore.instance.collection('Benevole');

  Future updateUserData(
    String nom, 
    String tel, 
    bool service1, 
    bool service2, 
    bool service3, 
    String description, 
    bool disponibilite,
    String profilepicpath,
    ) async {
    return await benevoleCollection.document(uid).setData({
      'Nom': nom,
      'Tel': tel, 
      'Service1': service1, 
      'Service2': service2,
      'Service3': service3,
      'Description': description, //autres services
      //'Location': needs maps Api 
      'Disponibilite': disponibilite,
      'ProfilePicPath': profilepicpath

    });
  }
  //getting user data
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      nom: snapshot.data['Nom'],
      tel: snapshot.data['Tel'],
      service1: snapshot.data['Service1'],
      service2: snapshot.data['Service2'],
      service3: snapshot.data['Service3'],
      description: snapshot.data['Description'],
      disponibilite: snapshot.data['Desponibilite'],
      profilepicpath: snapshot.data['ProfilePicPath'],
    );
  }
  //get benevole stream
  Stream<UserData> get benevole {
    return benevoleCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  } 

}