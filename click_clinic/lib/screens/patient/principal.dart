import 'package:click_clinic/screens/benevole/benevole.dart';
import 'package:click_clinic/screens/patient/database.dart';
import 'package:click_clinic/screens/patient/hopitaux.dart';
import 'package:click_clinic/screens/patient/pharmacies.dart';
import 'package:click_clinic/screens/patient/medecins.dart';
import 'package:click_clinic/screens/patient/sangg.dart';
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF4F8F9), //background
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Color(0xFF00B9FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          Align(
            alignment: Alignment(0.8, -0.8),
            child: SizedBox(
              child: Wrap(//later reformate with media Query
                    direction: Axis.vertical,
                  children: [
                    Wrap(
                children: [
                  SizedBox(width: 20,),
                  CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/patient.png"),
                  backgroundColor: Colors.white,
                ),]),
                FlatButton(
                  color: Color(0xFF00B9FF),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Benevole();
                    },
                  ));
                  },
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        "Patient ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 12,
                            fontFamily: 'Poppins-Regular'),
                      ),
                      CircleAvatar(
                        radius: 10,
                        child: Image.asset(
                          "assets/icones/selectionner.png",
                          color: Colors.white,
                        ),
                        backgroundColor: Color(0xFF00B9FF),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.7,
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
                    Text(
                      " Menu",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Light'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
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
                        return DonDeSang();
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
}

//redo the UI to make it responsive
//'patient' iconImageButton is not responsive