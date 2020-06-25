import 'package:click_clinic/screens/benevole/authenticate/services.dart';
import 'package:click_clinic/screens/benevole/home/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:getflutter/getflutter.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:click_clinic/services/database.dart';
import 'package:provider/provider.dart';
import 'package:click_clinic/models/user.dart';
import 'package:click_clinic/shared/acceuil.dart';


class Try extends StatefulWidget {
  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {

  final AuthService _auth = AuthService();
  File _image;
  bool _isVisible = false;
  String _imageUrl, _imagepath ;
  bool _isSwitched = false;
  String _disp = 'Non Disponible';

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    return StreamBuilder<UserData>(
        //the provider to bypass user name & photo & disponibility
        stream: DatabaseService(uid: user.uid).benevole,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            /*if(userData.disponibilite != null) {
              _isSwitched = userData.disponibilite ;
              print('assigned');
              if (_isSwitched) _disp = 'Disponible' ;else _disp = 'Non Disponible';
            }
            if(userData.profilepicpath != null) _imagepath = userData.profilepicpath;*/
            return Material(
      child:  Scaffold(
          body: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4F8F9), //background
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height / 2.6,
              decoration: BoxDecoration(
                color: Color(0xFF00B9FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77)),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 70,left: 290),
                child: CircleAvatar(
                  radius:20,
                  child: Image.asset("assets/images/patient.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 105 ,left: 260, right: 5),
                      child:FlatButton(
                        color: Color(0xFF00B9FF),
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Bénévole ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins-Regular'
                              ),
                            ),
                            CircleAvatar(
                              radius:10,
                              child: Image.asset("assets/icones/selectionner.png", color: Colors.white,),
                              backgroundColor: Color(0xFF00B9FF),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70 ,left: 30, right: 220),
                  child: RaisedButton(
                    color:Color(0xFF00B9FF),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Acceuil();
                      },));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius:10,
                          child: Image.asset("assets/icones/menu.png"),
                          backgroundColor: Color(0xFF00B9FF),
                        ),
                        Text(
                          " Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins-Light'
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 410,
              child: Padding(
                padding: EdgeInsets.only(top: 200),
                child: Center(
                  child: Stack(children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(55)),
                      ),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(55)),
                          ),
                          child: GFAvatar(
                          shape: GFAvatarShape.circle,
                            radius: 70,
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(55)),
                              child: SizedBox(
                                height: 360,
                                child: (_image == null)
                                     ? _imageUrl == null
                                     ? Image.asset(
                                      //default image
                                       "assets/images/clickclinic.png",
                                        fit: BoxFit.fill,
                                      )
                                     : Image.network(
                                       _imageUrl,
                                       fit: BoxFit.fill
                                     )
                                     : Image.file(
                                        _image,
                                        fit: BoxFit.fill
                                      ),
                               ),
                            ),
                          )
                       ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 115.0, right: 0.0, left: 115),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 25.0,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {
                          getImage();
                          setState(() {
                            _isVisible = true;
                          });
                        },
                      ),
                    )
                  ]),
                ),
              ),
            ),

            Container(
                width: MediaQuery.of(context).size.width,
                //height: 360,
                padding: EdgeInsets.only(top: 360, left: 180),
                child:  
                _isVisible
                    ? Row(
                        children: <Widget>[
                          RaisedButton(
                            color: Color(0xff476cfb),
                            onPressed: () {
                              setState(() {
                                _isVisible = false;
                              });
                            },
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11.0),
                            ),
                          ),
                          RaisedButton(
                            color: Color(0xff476cfb),
                            onPressed: () async {
                              uploadPic(context);
                              print(_imagepath);
                              if (_imagepath != null){
                                await DatabaseService(uid: user.uid).updateUserData(
                                userData.nom ?? snapshot.data.nom,
                                userData.tel ?? snapshot.data.tel,
                                userData.service1 ?? snapshot.data.service1,
                                userData.service2 ?? snapshot.data.service2,
                                userData.service3 ?? snapshot.data.service3,
                                userData.description ?? snapshot.data.description,
                                userData.disponibilite ?? snapshot.data.disponibilite,
                                _imagepath ?? snapshot.data.profilepicpath
                            );
                            setState(() {
                              _isVisible = false;
                              print('Image Path Uploaded !');
                            });
                            }
                            },
                            child: Text(
                              'Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11.0),
                            ),
                          ),
                        ],
                      )
                    : Text(''),
            ),

            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 180)),
                  Text(
                    'Que Voulez-vous faire?',
                     style: TextStyle(fontSize: 26, color: Colors.white, fontFamily: 'Poppins-Medium'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 200),),
                  Text(
                    userData.nom,
                    style: TextStyle(fontSize: 22, color: Colors.black, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(top: 7.5),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text(
                      _disp,
                      style: TextStyle(fontSize: 17.5, color: Colors.black, fontFamily: 'SegoeUI', fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 30),
                    CupertinoSwitch(
                      value: _isSwitched, 
                      onChanged: (value) async {
                          setState(() {
                            _isSwitched = value; 
                            print("Switched");
                            if (!_isSwitched )  _disp = 'Non Disponible';//
                            else if (_isSwitched) _disp = 'Disponible';
                          });
                          if (_isSwitched != null){
                                await DatabaseService(uid: user.uid).updateUserData(
                                userData.nom ?? snapshot.data.nom,
                                userData.tel ?? snapshot.data.tel,
                                userData.service1 ?? snapshot.data.service1,
                                userData.service2 ?? snapshot.data.service2,
                                userData.service3 ?? snapshot.data.service3,
                                userData.description ?? snapshot.data.description,
                                _isSwitched ?? snapshot.data.disponibilite,
                                userData.profilepicpath ?? snapshot.data.profilepicpath
                            );
                            setState(() {
                              print('Switch uploaded ${_isSwitched}');
                            });
                          }
                      },
                      activeColor: Colors.greenAccent[400],
                    )
                  ],),
                  Padding(
                    padding: EdgeInsets.only(top:40),
                  ),
                  SizedBox(
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Settings();
                        },));
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              //child: Image.asset("assets/icones/medecin.png"),
                              backgroundColor: Color(0xFF00B9FF),
                            ),
                            Text(
                              "   Paramétres du Compte",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Poppins-Regular',
                                color: Color(0xFF00B9FF)
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: 300,
                      height: 55,
                    ), 
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                  SizedBox(
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Settings();
                        },));
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              //child: Image.asset("assets/icones/medecin.png"),
                              backgroundColor: Color(0xFF00B9FF),
                            ),
                            Text(
                              "   Paramétres des Services",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Poppins-Regular',
                                color: Color(0xFF00B9FF)
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: 300,
                      height: 55,
                    ),
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                    ),
                  SizedBox(
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () async {
                          await _auth.signOut();
                         },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 15,
                              //child: Image.asset("assets/icones/medecin.png"),
                              backgroundColor: Colors.red,
                            ),
                            Text(
                              "  Déconnexion",
                              style: TextStyle(
                                fontSize: 16.5,
                                fontFamily: 'Poppins-Regular',
                                color: Colors.red
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: 190,
                      height: 45,
                    ),       
                ],
              ),
            )

          ]),
        ),
 
    );
  }else
     return Loading();
  });}

  // upload pic to firebase storage
    Future uploadPic(BuildContext context) async {
      try {
        String fileName = basename(_image.path);
        StorageReference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('Bénévoles/${fileName}');
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
        setState(() {
          print("Profile Picture uploaded");
          _isVisible = false;
          /*Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Profile Picture Uploaded')));*/
          _imagepath = fileName;
        });
      } catch (ex) {
        //change it with a dialog 
        /*Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(ex.message),
        ));*/
        print(ex.message);
      }
    }

    //put this getter in database.dart with its sisters
    Future<bool> getDispo() async{
      final userA = await _auth.getCurrentUserInfo();
      final firestoreInstance = Firestore.instance;
      firestoreInstance.collection("Benevole").document(userA.uid).get().then((value){
      print(value.data["Disponibilite"]);
      _isSwitched = value.data["Disponibilite"];
    });
    
      setState(() { if (_isSwitched) _disp = 'Disponible' ;else _disp = 'Non Disponible';}) ;
      /*.updateData({"Profilepathpic": 60}).then((_) {
      print("success!");
    });*/
    return _isSwitched;
    }

    Future<String> getProfileUrl() async{
      final userA = await _auth.getCurrentUserInfo();
      final firestoreInstance = Firestore.instance;
      firestoreInstance.collection("Benevole").document(userA.uid).get().then((value){
      print(value.data["ProfilePicPath"]);
      _imagepath = value.data["ProfilePicPath"];
    });
    print(_imagepath);
    return _imagepath;
    }

    void initState() {
      super.initState();
      print(getDispo());
      print(getProfileUrl());
      var ref = FirebaseStorage.instance.ref().child('Bénévoles/benevole-profile.jpeg');
      ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));
      
    }
}
