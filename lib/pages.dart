export 'dart:async';
export 'groupeSang.dart';
export 'package:flutter_phone_state/flutter_phone_state.dart';
export 'package:flutter/material.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:camera/camera.dart';
export 'drawerp.dart';
export 'drawerb.dart';
export 'paraDapp.dart';
/*
import 'package:click_clinic/screens/benevole/benevole.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/screens/patient/principal.dart';
/*import 'package:click_clinic/switcher.dart';
import 'package:flutter/services.dart';*/

class Acceuil extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  //when true shows this page , when false shows onboarding
  //purpose is to show onboarding only once
  bool toggle = true;

  //this variable is used to permanentally stay at patient/benevole page through Switcher(path: path)
  //not practical
  String path = '';

  @override
  Widget build(BuildContext context) {
    return /*toggle && path == ''
        ?*/
        Material(
      child: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          color: Color(0xFFDAE9EE),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 80),
                ),
                MyImage(),
                Padding(
                  padding: EdgeInsets.only(top: 14),
                ),
                Text(
                  "ClickClinic",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF00B9FF),
                      fontFamily: 'CenturyGothic-Bold'),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset('assets/images/acceuil.png'),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Je suis un ...",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                    ),
                    SizedBox(
                      child: RaisedButton(
                        color: Color(0xFF00B9FF),
                        onPressed: () {
                          /*setState(() {
                              toggle = false;
                              path = 'benevole';
                            });*/
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Benevole();
                            },
                          ));
                        },
                        child: Text(
                          "Bénevole",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontFamily: 'Poppins-Regular'),
                        ),
                        shape: RoundedRectangleBorder(
                            //changed
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: 150,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                    ),
                    SizedBox(
                      child: RaisedButton(
                        color: Color(0xFF00B9FF),
                        onPressed: () {
                          /*setState(() {
                                 toggle = false;
                                 path = 'patient';
                                });*/
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Patient();
                            },
                          ));
                        },
                        child: Text(
                          "Patient",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontFamily: 'Poppins-Regular'),
                        ),
                        shape: RoundedRectangleBorder(
                            //changed
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      width: 150,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 95),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 95),
                ),
                Text(''),
              ],
            ),
          ),
        ),
      ),
    )
        /*: Switcher(path: path)*/;
  }
}
//onPressed t3 patient / benevole has a setState that changes a str and passed it as an argument to switcher

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("assets/images/clickclinic.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}
//not responsive
//redo the UI to make it responsive
import 'package:click_clinic/screens/patient/database.dart';
import 'package:click_clinic/screens/patient/hopitaux.dart';
import 'package:click_clinic/screens/patient/pharmacies.dart';
import 'package:click_clinic/screens/patient/medecins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:click_clinic/shared/acceuil.dart';
import 'package:click_clinic/screens/patient/autre.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280.0,
            decoration: BoxDecoration(
              color: Color(0xFF00B9FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 220),
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
                    radius: 10,
                    child: Image.asset("assets/icones/menu.png"),
                    backgroundColor: Color(0xFF00B9FF),
                  ),
                  CircleAvatar(
                    radius: 10,
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
          Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 150)),
                Text(
                  'Que cherchez-vous ?',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'Poppins-Medium'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Medecins();
                        },
                      ));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/medecin.png"),
                          backgroundColor: Colors.blueGrey[100],
                        ),
                        Text(
                          "     Un médecin",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Hopitaux();
                        },
                      ));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/hopital.png"),
                          backgroundColor: Colors.lightGreen[100],
                        ),
                        Text(
                          "     Un hôpital",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Pharmacies();
                        },
                      ));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/phramacie.png"),
                          backgroundColor: Colors.lightGreen[100],
                        ),
                        Text(
                          "    Une pharmacie",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchResult();
                      }));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/sang.png"),
                          backgroundColor: Colors.red[100],
                        ),
                        Text(
                          "     Du sang",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Autre();
                        },
                      ));
                    },
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/autre.png"),
                          backgroundColor: Colors.grey[200],
                        ),
                        Text(
                          "     Autre",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
