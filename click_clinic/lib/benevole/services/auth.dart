import 'package:click_clinic/benevole/models/user.dart';
import 'package:click_clinic/benevole/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
     //.map((FirebaseUser user) => _userFromFirebaseUser(user));
     .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null; //if we fail auth 
    }

  }

  //sign in with email & password
  Future connexion(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;  
      return _userFromFirebaseUser(user)  ;
    }catch(e){
      print(e.toString());
      return null;
    }
  } 

  //register with email & password
  Future inscription(String email, String password, String nom, String tel) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;  

      //create new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(nom, tel, false , false , false, '', false , null);
      return _userFromFirebaseUser(user)  ;
    }catch(e){
      print(e.toString());
      /* showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });*/
      return null;
    }
  } 

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}

