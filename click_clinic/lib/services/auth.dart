import 'package:click_clinic/models/user.dart';
import 'package:click_clinic/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

	  Future<dynamic> connexion(String email, String password);
	
	  Future<dynamic> inscription(String email, String password, String nom, String tel, String disc, bool service1, bool service2, bool service3);
	
	  //Future<FirebaseUser> getCurrentUser();
	
	  Future<void> sendEmailVerification();
	
	  Future<void> signOut();

	  Future<bool> isEmailVerified();
	
	  Future<void> changeEmail(String email);
	
	  Future<void> changePassword(String password);
	
	  Future<void> deleteUser();
	
	  Future<void> sendPasswordResetMail(String email);
	}


class AuthService implements BaseAuth{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
     .map(_userFromFirebaseUser);
  }

  Future getCurrentUserInfo() async {
    return await _auth.currentUser();
  }

  //SignIn with email and password
  Future connexion(String email, String password) async {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;  
      return _userFromFirebaseUser(user)  ;
  } 

  //SignUp
  Future inscription(String email, String password, String nom, String tel, String disc, bool service1, bool service2, bool service3 ) async {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;  
      //create new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(
        nom, tel, service1 , service2 , service3, disc, false , '');
      return _userFromFirebaseUser(user)  ;
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

  Future<void> sendEmailVerification() async {
	    FirebaseUser user = await _auth.currentUser();
       user.sendEmailVerification();
	  }
	

	  Future<bool> isEmailVerified() async {
	    FirebaseUser user = await _auth.currentUser();
	    return user.isEmailVerified;
	  }
	

	  @override
	  Future<void> changeEmail(String email) async {
	    FirebaseUser user = await _auth.currentUser();
	    user.updateEmail(email).then((_) {
	      print("Succesfull changed email");
	    }).catchError((error) {
	      print("email can't be changed" + error.toString());
	    });
	    return null;
	  }
	

	  @override
	  Future<void> changePassword(String password) async {
	    FirebaseUser user = await _auth.currentUser();
	    user.updatePassword(password).then((_) {
	      print("Succesfull changed password");
	    }).catchError((error) {
	      print("Password can't be changed" + error.toString());
	    });
      return null;
	  }
	

	  @override
	  Future<void> deleteUser() async {
	    FirebaseUser user = await _auth.currentUser();

      firestoreInstance.collection("Benevole").document(user.uid).delete().then((_) {
      print("success!");
      });

	    user.delete().then((_) {
	      print("Succesfull user deleted");
	    }).catchError((error) {
	      print("user can't be delete" + error.toString());
	    });
	    return null;
	  }
	

	  @override
	  Future<void> sendPasswordResetMail(String email) async{
	    await _auth.sendPasswordResetEmail(email: email);
	    return null;
	  }

}

