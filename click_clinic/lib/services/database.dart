import 'package:click_clinic/screens/benevole/authenticate/inscription.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:click_clinic/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  // collection reference 
  final CollectionReference benevoleCollection = Firestore.instance.collection('Benevole');
  final AuthService _auth = AuthService();

  //setters
  //update all user data
  Future updateUserData(
    Inscription user
    ) async {
    return await benevoleCollection.document(uid).setData({
      'Nom': user.getNom(),
      'Tel': user.getTel(), 
      'Service1': user.getService1(), 
      'Service2': user.getService2(),
      'Service3': user.getService3(),//map or array including blood type
      'Description': user.getDescription(), //autres services
      'Location': user.getLocation(),
      'Adress': user.getAdresse(),
      'BloodType': user.getBloodType(),
      'Disponibilite': user.getDisponibilite(),
      'ProfilePicPath': user.getProfilepicpath(),

    });
  }

  //setNom
  void updateNom(String nom ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Nom": nom}).then((_){
      print("success!");
    });
  }
  //setTel
  void updateTel(String tel ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Tel": tel}).then((_){
      print("success!");
    });
  }

  //setService1
  void updateService1(bool val ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Service1": val}).then((_){
      print("success!");
    });
  }

  //setService2
  void updateService2(bool val ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Service2": val}).then((_){
      print("success!");
    });
  }

  //setService3
  void updateService3(bool val ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Service3": val}).then((_){
      print("success!");
    });
  }

  //setDescription
  void updateDescription(String val ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Description": val}).then((_){
      print("success!");
    });
  }

  //setDisponibilite
  void updateDisponibility(bool val ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"Disponibilite": val}).then((_){
      print("success!");
    });
  }

  //setProfilePathPic
  void updateProfilePathPic(String val ) async {
    final user = await _auth.getCurrentUserInfo();
    benevoleCollection.document(user.uid).updateData({"ProfilePicPath": val}).then((_){
      print("success!");
    });
  }

  //setLocation -> in carte.dart
  //setAdress

  //getters
  //getting all user data 
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      nom: snapshot.data['Nom'],
      tel: snapshot.data['Tel'],
      service1: snapshot.data['Service1'],
      service2: snapshot.data['Service2'],
      service3: snapshot.data['Service3'],
      description: snapshot.data['Description'],
      disponibilite: snapshot.data['Disponibilite'],
      profilepicpath: snapshot.data['ProfilePicPath'],
      location: snapshot.data['Location'],
      bloodtype: snapshot.data['BloodType'],
      adresse: snapshot.data['Adress']
    );
  }

  
  //get benevole stream
  Stream<UserData> get benevole {
    return benevoleCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  } 

  //get email
  Future<String> getEmail() async{
    String _email;
    await _auth.getCurrentUserInfo().then((value) => _email = value.email);
    return _email;
  }
  
  //get disponibility
  Future<bool> getDispo() async{
      final user = await _auth.getCurrentUserInfo();
      bool _isSwitched;
      benevoleCollection.document(user.uid).get().then((value){
      print(value.data["Disponibilite"]);
      _isSwitched = value.data["Disponibilite"];
    });
    return _isSwitched;
    }

  //get PictureUrl
  Future<String> getProfileUrl() async{
      final userA = await _auth.getCurrentUserInfo();
      String _imagepath;
      benevoleCollection.document(userA.uid).get().then((value){
      print(value.data["ProfilePicPath"]);
      _imagepath = value.data["ProfilePicPath"];
    });
    print('url: $_imagepath');
    return _imagepath;
    }

  //get nom
  Future<String> getNom() async{
      final user = await _auth.getCurrentUserInfo();
      String _nom;
      benevoleCollection.document(user.uid).get().then((value){
      print(value.data["Nom"]);
      _nom = value.data["Nom"];
    });
    return _nom;
    }
  
  //get tel
  Future<String> getTel() async{
      final user = await _auth.getCurrentUserInfo();
      String _tel;
      benevoleCollection.document(user.uid).get().then((value){
      print(value.data["Tel"]);
      _tel = value.data["Tel"];
    });
    return _tel;
    }
  
  //get description
  Future<String> getDescription() async{
      final user = await _auth.getCurrentUserInfo();
      String _disc;
      benevoleCollection.document(user.uid).get().then((value){
      print(value.data["Description"]);
      _disc = value.data["Description"];
    });
    return _disc;
    }
  
  //get location (display it in search)
  //get service1
  //get service2
  //get service3 (map or array to include blood type)
  //get adress)

}
