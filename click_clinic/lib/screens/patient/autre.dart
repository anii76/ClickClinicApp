import 'package:click_clinic/screens/patient/imagerie.dart';
import 'package:click_clinic/screens/patient/labo.dart';
import 'package:click_clinic/screens/patient/opticiens.dart';
import 'package:click_clinic/screens/patient/parapharmacie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/screens/patient/principal.dart';

class Autre extends StatefulWidget {
  @override
  _AutreState createState() => _AutreState();
}

class _AutreState extends State<Autre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF4F8F9),
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
            alignment: Alignment(0.7, -0.8),
            child: SizedBox(
              child: Text(
                "Autres",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 45,
                    fontFamily: 'Poppins-Medium'),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.73, -0.83),
            child: SizedBox(
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Patient();
                    },
                  ));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 10,
                      child: Image.asset("assets/icones/retour.png"),
                      backgroundColor: Color(0xFF00B9FF),
                    ),
                    Text(
                      " Accueil",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 47,
                          fontFamily: 'Poppins-Light'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2.7,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.55),
            child: Text(
              'Cherchez-vous alors...',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 28,
                  color: Colors.white,
                  fontFamily: 'Poppins-Medium'),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.33),
            child: SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Laboratoires();
                    },
                  ));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 25,
                      child: Image.asset("assets/icones/labo.png"),
                      backgroundColor: Colors.red[100],
                    ),
                    Text(
                      "     Un laboratoire",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 37, 
                          fontFamily: 'Poppins-Regular',
                          ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.15,
              height: MediaQuery.of(context).size.height / 10,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.05),
            child: SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CentreImageries();
                    },
                  ));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 25,
                      child: Image.asset("assets/icones/imagerie.png"),
                      backgroundColor: Colors.blueGrey[100],
                    ),
                    Text(
                      " Un centre d'imagerie",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 37, 
                          fontFamily: 'Poppins-Regular',
                          ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.15,
              height: MediaQuery.of(context).size.height / 10,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.23),
            child: SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Parapharmacies();
                    },
                  ));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 25,
                      child: Image.asset("assets/icones/parapharmacie.png"),
                      backgroundColor: Colors.green[100],
                    ),
                    Text(
                      " Une parapharmacie",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 37, 
                          fontFamily: 'Poppins-Regular',
                          ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.15,
              height: MediaQuery.of(context).size.height / 10,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.51),
            child: SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Opticiens();
                    },
                  ));
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 25,
                      child: Image.asset("assets/icones/opticien.png"),
                      backgroundColor: Colors.amber[100],
                    ),
                    Text(
                      "      Un opticien",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 37, 
                          fontFamily: 'Poppins-Regular',
                          ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.15,
              height: MediaQuery.of(context).size.height / 10,
            ),
          ),
        ],
      ),
    );
  }
}
