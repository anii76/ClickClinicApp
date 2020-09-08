import 'package:click_clinic/screens/benevole/home/parametreCompte.dart';
import 'package:click_clinic/screens/benevole/home/parametreService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
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
  String _imageUrl, _imagepath;
  bool _isSwitched = false;

  //show error msg

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    //void _showSuccessMessage()

    void _showConfirmMessage() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Modifier votre photo"),
            content: new Text(
                "Etes vous sur de vouloir modifier votre photo de profil ? "),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Annuler"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("Confirmer"),
                onPressed: () async {
                  uploadPic(context);
                  print(_imagepath);
                  if (_imagepath != null) {
                    DatabaseService(uid: user.uid)
                        .updateProfilePathPic(_imagepath);
                    setState(() {
                      print('Image Path Uploaded !');
                      //_showSuccessMessage();
                      //Navigator.of(context).pop();
                    });
                  }
                },
              ),
            ],
          );
        },
      );
    }

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        print('Image Path $_image');
        _showConfirmMessage();
      });
    }

    //void _getImageFromCamera()

    //void _uploadCamera&Gallery()

    return StreamBuilder<UserData>(
        //the provider to bypass user name & photo & disponibility
        stream: DatabaseService(uid: user.uid).benevole,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Material(
              child: Scaffold(
                body: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F8F9), //background
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.6,
                    decoration: BoxDecoration(
                      color: Color(0xFF00B9FF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(77),
                          bottomRight: Radius.circular(77)),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.45, -0.83),
                    child: Image.asset("assets/images/l.png"),
                  ),
                  Align(
                    alignment: Alignment(-0.8, -0.85),
                    child: SizedBox(
                      width: 80,
                      child: RaisedButton(
                        color: Color(0xFF00B9FF),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Acceuil();
                            },
                          ));
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset("assets/icones/menu.png"),
                              backgroundColor: Color(0xFF00B9FF),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.6),
                    child: Text(
                      'Que Voulez-vous faire?',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.3),
                    child: FlatButton(
                      onPressed: () {
                        print('tapped');
                        getImage();
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/man.png"),
                        radius: MediaQuery.of(context).size.height / 10, 
                        child: ClipOval(
                          child: (_image == null)
                              ? _imageUrl == null
                                  ? Image.asset(
                                      //default image
                                      "assets/images/man.png",
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(_imageUrl, fit: BoxFit.fill)
                              : Image.file(_image, fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.1),
                    child: Text(
                      userData.nom,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Disponibilité :',
                          style: TextStyle(
                              fontSize: 17.5,
                              color: Colors.black,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 30),
                        CupertinoSwitch(
                          value: _isSwitched,
                          onChanged: (value) async {
                            setState(() {
                              _isSwitched = value;
                              print("Switched");
                            });
                            if (_isSwitched != null) {
                              DatabaseService(uid: user.uid)
                                  .updateDisponibility(_isSwitched);
                              setState(() {
                                print('Switch uploaded ${_isSwitched}');
                              });
                            }
                          },
                          activeColor: Colors.greenAccent[400],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.5),
                    child: SizedBox(
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ParaDuCompte();
                            },
                          ));
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 35,
                              child: ClipOval(
                                  child:
                                      Image.asset("assets/icones/user.png")),
                              backgroundColor: Color(0xFF00B9FF),
                            ),
                            Text(
                              "   Paramétres du Compte",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Poppins-Regular',
                                  color: Color(0xFF00B9FF)),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: MediaQuery.of(context).size.width / 1.3, 
                      height: MediaQuery.of(context).size.height / 14, 
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.7),
                    child: SizedBox(
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ParaDesServices();
                            },
                          ));
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 35,
                              child: ClipOval(
                                  child:
                                      Image.asset("assets/icones/customer.png")),
                              backgroundColor: Color(0xFF00B9FF),
                            ),
                            Text(
                              "   Paramétres des Services",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Poppins-Regular',
                                  color: Color(0xFF00B9FF)),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: MediaQuery.of(context).size.width / 1.3, 
                      height: MediaQuery.of(context).size.height / 14,
                    ),
                  ),
                ]),
              ),
            );
          } else
            return Loading();
        });
  }

  // upload pic to firebase storage
  Future uploadPic(BuildContext context) async {
    try {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Bénévoles/${fileName}');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      //loading variable
      var downurl = await (await uploadTask.onComplete).ref.getDownloadURL();
      var url = downurl.toString();
      print('downloadurl: $url');
      setState(() {
        print("Profile Picture uploaded");
        _imagepath = url;
        //stop loading
      });
    } catch (ex) {
      //error message
      print(ex.message);
    }
  }

  Future<bool> getDispo() async {
    final userA = await _auth.getCurrentUserInfo();
    final firestoreInstance = Firestore.instance;
    firestoreInstance
        .collection("Benevole")
        .document(userA.uid)
        .get()
        .then((value) {
      print(value.data["Disponibilite"]);
      setState(() {
        _isSwitched = value.data["Disponibilite"];
      });
    });
    return _isSwitched;
  }

  Future<String> getProfileUrl() async {
    final userA = await _auth.getCurrentUserInfo();
    final firestoreInstance = Firestore.instance;
    firestoreInstance
        .collection("Benevole")
        .document(userA.uid)
        .get()
        .then((value) {
      print('value : ${value.data["ProfilePicPath"]}');
      _imageUrl = value.data["ProfilePicPath"];
      print('url in firestore : $_imageUrl');
    });
    return _imageUrl;
  }

  void initState() {
    super.initState();
    getDispo();
    getProfileUrl();
  }
}
